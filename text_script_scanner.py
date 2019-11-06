import sys
import os
from typing import List, Union, Tuple
import argparse
import text_script_dumper as dumper
import definitions


def error(m):
    print('error: {m}'.format(**vars()))
    exit(1)

def main(argv):
    parser = argparse.ArgumentParser(description='Scans the ROM for TextScripts', add_help=False)
    parser.add_argument('rom_file', help='the ROM file to process the archives in')
    parser.add_argument('archive_list_file', help='this file specifies all archives in the ROM.')
    parser.add_argument('cmd', type=str, help='command to execute regarding the archive list',)

    # add list of commands and their descriptions to usage
    help = parser.format_help() + '\n'
    help += 'available commands:\n'
    for cmd in filter(lambda key: not key.startswith('__'), Commands.__dict__.keys()):
        help += "  {0}: {1}\n".format(cmd, getattr(Commands, cmd)(None, None, None, get_desc=True))
    help += ' \n' # for some reason, I had to add that space for it to add an empty new line
    parser.usage = help[help.index(':')+1:]

    # when specifying argv, it mustn't contain the program name
    args = parser.parse_args(argv[1:4])

    getattr(Commands, args.cmd)(args.rom_file, args.archive_list_file, argv[4:])

class Commands:
    @staticmethod
    def get_compressed_archives(rom_path, archive_path, argv,  get_desc=False):
        desc = 'Searchess all archives and returns only the compressed ones'
        if get_desc:
            return desc

        parser = argparse.ArgumentParser(description=desc)
        parser.prog = parser.prog + ' ' + Commands.get_compressed_archives.__name__
        args = parser.parse_args(argv)

        archives = process_archives(archive_path)

        # find the compressed and non-compressed archives and cache the result to disk
        compressed_archives, regular_archives = cache_separate_archives_based_on_compression(archive_path, rom_path, archives)

        for ptr, size in compressed_archives:
            print(hex(ptr), size)

        print(len(compressed_archives), len(regular_archives))

    @staticmethod
    def dump_archives(rom_path, archive_path, argv, get_desc=False):
        desc = 'Invokes the textscript dumper on all non-compressed archive and outputs collective results'
        if get_desc:
            return desc

        parser = argparse.ArgumentParser(description=desc)
        parser.prog = parser.prog + ' ' + Commands.dump_archives.__name__
        parser.add_argument('--compressed', action='store_true')
        parser.add_argument('--noncompressed', action='store_true')
        parser.add_argument('--error', action='store_true')
        args = parser.parse_args(argv)

        archives = process_archives(archive_path)

        compressed_archives, regular_archives = cache_separate_archives_based_on_compression(archive_path, rom_path, archives)

        error_count_reg = 0
        error_count_comp = 0
        correct_count_reg = 0
        correct_count_comp = 0
        with open(rom_path, 'rb') as rom_file:
            if args.noncompressed:
                for archive_ptr, archive_size in regular_archives:
                        i = error_count_reg + correct_count_reg
                        print('reg[{i}]: @archive 0x{archive_ptr:X} (size: {archive_size})'.format(**vars()))
                        try:
                            textscript_archive = dumper.TextScriptArchive.read_script(dumper.CommandContext(), archive_ptr, rom_file)
                            correct_count_reg += 1
                            # print(textscript_archive.build())
                        except Exception:
                            error_count_reg += 1
                            if args.error: raise

                print('error_count_uncompressed: %d' % (error_count_reg))
                print('correct_count_uncompressed: %d' % (correct_count_reg))

            if args.compressed:
                 for archive_ptr, archive_size in compressed_archives:
                    decompress_path = 'TextScript%07X.lz.bin' % (archive_ptr)
                    gbagfx_decompress_at(rom_file, archive_ptr, decompress_path)
                    size = os.path.getsize(decompress_path) - 4 # must not account for the compression header!
                    with open(decompress_path, 'rb') as decompressed_file:
                        i = error_count_comp + correct_count_comp
                        print('comp[{i}]: @archive 0x{archive_ptr:X} (size: {archive_size})'.format(**vars()))
                        try:
                            textscript_archive = dumper.TextScriptArchive.read_script(dumper.CommandContext(), 4, decompressed_file, size)
                            correct_count_comp += 1
                        except Exception:
                            error_count_comp += 1
                            if args.error: raise

                    os.remove(decompress_path)
                 print('error_count_compressed: %d' % (error_count_comp))
                 print('correct_count_compressed: %d' % (correct_count_comp))

        print('compressed to noncompressed scanned')
        print(len(compressed_archives), len(regular_archives))



def cache_to_disk(func, cache_path, *args, **kwargs):
    """
    caches the result of :func: to a file so that it doesn't have to be computed more than once
    :param func: function with expensive computation
    :param cache_path: file to cache to`
    :param args: args to :func:
    :param kwargs: kwargs to :func:
    :return: results of func as cached in :path_name:
    """
    import json
    if os.path.exists(cache_path):
        # return deserialized output
        with open(cache_path, 'r') as f:
            return json.load(f)
    else:
        # compute and serialize to cache
        res = func(*args, **kwargs)
        with open(cache_path, 'w') as f:
            json.dump(res, f)
        return res


def separate_archives_based_on_compression(rom_path, archives):
    compressed_archives = []
    regular_archives = []
    with open(rom_path, 'rb') as rom_file:
        for archive_ptr, archive_size in archives:
            # size = getLZ77CompressedSize(rom_file, archive_ptr)
            size = gbagfx_get_compressed_size_at(rom_file, archive_ptr & ~0x8000000)
            if size is not None:
                compressed_archives.append((archive_ptr, size))
            else:
                regular_archives.append((archive_ptr, archive_size))

    return compressed_archives, regular_archives


def cache_separate_archives_based_on_compression(archive_path, rom_path, archives):
    # find the compressed and non-compressed archives and cache the result to disk
    cache_path = os.path.join(definitions.CACHE_DIR, separate_archives_based_on_compression.__name__ + '.' + os.path.basename(archive_path) + '.cache')
    return cache_to_disk(separate_archives_based_on_compression, cache_path,
                                                          rom_path, archives)


def process_archives(archive_path) -> List[int]:
    """
    format: lines of @archive <archive_ptr_hex>
    :return: list of archive pointers
    """

    out = []
    processed_unit = False
    with open(archive_path, 'r') as archive_file:
        for line in archive_file.readlines():
            if line.startswith('@archive'):
                archive_ptr = int(line.split(' ')[1], 16)
                out.append(archive_ptr)
            if line.startswith('@size'):
                size = int(line.split(' ')[1], 16)
                out[-1] = (out[-1], size)

    return out

def read_archives(archives_path):
    # will segment all text scripts that are contigious
    out = {}
    with open(archives_path, 'r') as f:

        lines = f.readlines()
        if len(lines) % 2 != 0:
            raise Exception('error: must be an even number of lines.')
        for i in range(0, len(lines), 2):
            addr = int(lines[i].split(' ')[1], 16)
            size = int(lines[i+1].split(' ')[1], 10)
            out[addr] = {
                'nscripts': size
            }
    return out

def gbagfx_get_compressed_size_at(rom_file, address):
    decompressed_path = hex(address) + '.compsize.tmp'
    compressed_path = decompressed_path + '.lz'
    if gbagfx_decompress_at(rom_file, address, decompressed_path) != 0:
        return None
    if gbagfx_compress(decompressed_path, compressed_path) != 0:
        raise IOError('could not compress file')
    size = os.path.getsize(compressed_path)
    os.remove(decompressed_path)
    os.remove(compressed_path)
    return size


def getLZ77CompressedSize(bin_file, compressed_ea):
    """
    Iterates the compressed data, and returns its size
    :param compressed_ea: the linear address of the compressed data
    :return: its size in bytes or <0 if this is an invalid format, decompressed size
    """
    dataHeader = 0
    original_addr = bin_file.tell()
    bin_file.seek(compressed_ea)
    chars = bin_file.read(4)
    for i in range(len(chars)):
        dataHeader |= chars[i] << 8*i
    decompSize = (dataHeader & ~0xFF) >> 8

    # compression type must match
    if (dataHeader & 0xF0) >> 4 != 1:
        return -1

    # iterate, and figure out the number of bytes copied
    size = 0
    ea = compressed_ea + 4
    # iterate the blocks and keep count of the data size
    while size < decompSize:
        # parse block flags (compressed or not)
        bin_file.seek(ea)
        flags = bin_file.read(1)[0]
        ea += 1

        # iterate the blocks, MSB first.
        for i in range(7, -1, -1):
            if flags & (1<<i):
                # block i is compressed
                bin_file.seek(ea)
                chars = bin_file.read(2)
                block = chars[0] + (chars[1] << 8)
                size += ((block & 0xF0) >> 4) + 3
                ea += 2
                # check that the displacement doesn't underflow
                disp = ((block & 0xFF00) >> (16-4)) | block & 0xF
                if size - disp - 1 < 0:
                    return -2
            else:
                # block i is uncompressed, it's just one byte
                size += 1
                ea += 1
            # we might finish decompressing while processing blocks
            if size >= decompSize:
                # ensure that the rest of the flags are 0!
                # this is a practical restriction. (likely true, not technically part of the specs)
                for j in range(i, -1, -1):
                    if flags & (1<<j) != 0:
                        return -3
                break

    bin_file.seek(original_addr)
    return (ea - compressed_ea, decompSize)

def gbagfx_decompress_at(rom_file, compressed_data_address: int, output_path: str):
    # write from compressed data address onwards to a file. This is because size is not known, but the LZ77 decompression
    # can tell
    slice_file_path = output_path + '.tmp_slice.lz'
    with open(slice_file_path, 'wb') as slice_file:
        rom_file.seek(compressed_data_address)
        slice_file.write(rom_file.read())

    # decompress file
    gbagfx_bin = os.path.join(definitions.ROM_REPO_DIR, 'tools', 'gbagfx', 'gbagfx')
    status = os.system('{gbagfx_bin} {slice_file_path} {output_path} 2> /dev/null'.format(**vars()))

    os.remove(slice_file_path)
    return status

def gbagfx_compress(input_path: str, output_lz_path: str):
    if not output_lz_path.endswith('.lz'):
        raise ValueError('lz_path must end with .lz as that is expected by gbagfx')

    gbagfx_bin = os.path.join(definitions.ROM_REPO_DIR, 'tools', 'gbagfx', 'gbagfx')
    return os.system('{gbagfx_bin} {input_path} {output_lz_path} '.format(**vars()))


def size_scan_archives(bin_file, archives_path):
    archives = read_archives(archives_path)
    for archive_addr in archives.keys():
        bin_file.seek(bin_file)
        # try to determine decompression size
        size = getLZ77CompressedSize(archive_addr, bin_file)
        if size < 0:
            # try to parse it as text script and get the size
            scr = dumper.read('./', )

if __name__ == '__main__':
    main(sys.argv)