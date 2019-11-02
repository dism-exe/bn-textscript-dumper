# This will parse a textScript at the address specified, from the file specified.
# if no file is specified, it will use the default ('../../bn6f.ign')
# ini_file defaults to 'mmbn6.ini'
from os import path
import sys
import configparser

config = configparser.ConfigParser()
config.read('config.ini')
config.read('../config.ini') # in case of testing

class ModuleState:
    if path.exists('config.ini'):
        CUR_DIR = ''
    else:
        CUR_DIR = '../'
    PROJ_PATH = CUR_DIR + config['Paths']['DissassemblyProjectPath']
    TBL_PATH = PROJ_PATH + config['Paths']['GameStringTblPath']
    INI_DIR = CUR_DIR + config['Paths']['CommandDatabaseIniDirPath']
    ROM_PATH = PROJ_PATH + config['Paths']['RomPath']
    LOG = True
    LOG_FILE = sys.__stdout__
    RAISE_ALL = False

    # the select command is dynamic unlike any other command, so it's its own category
    DYNAMIC_CMDS = [b'\xed']

    # priority commands are prioritized by their input, ie. their bases are in conflict but are
    # respolved with priority. this only applies to jump.
    PRIORITY_CMDS = [b'\xf0']

    # commands that are parsed correctly with the secondary interpreter, when they can be primary
    # 0xef: this is the case in ts_check_game_version and ts_check_global, the way to know if it's
    # ts_check_global is if ts_check_game_version fails
    # 0xfa: print commands also have conflicts between the interpreters
    # TODO 0xf2: clearMsg conflicting with printBuffer
    CONFLICT_CMDS = [b'\xef', b'\xfa', b'\xf2']

    # each family carries different masking
    BITFIELD_CMDS = [b'\xfa\x00', b'\xf2']


ModuleState.config = config

def printlocals(locals, halt=False):
    s = ''
    for key in locals:
        s += '%s: %s\n' % (str(key), str(locals[key]))
    if halt:
        raise Exception(s)
    else:
        print(s)

def log(*args, **kwargs):
    if ModuleState.LOG:
        print(*args, **kwargs)

class TextScriptException(Exception):
    pass

class InvalidTextScriptCommandException(Exception):
    pass


def error(exception, msg, critical=True):
    """
    for debugging purposes, sometimes it's useful to see the faulty output than to
    completely halt execution. Also doubles as a logging means for those errors in that case.
    specify critical to False for an exception not to be raised.
    """
    if 'list' not in error.__dict__:
        error.list = []
    if critical or ModuleState.RAISE_ALL:
        raise exception(msg)
    error.list.append(msg)


error.list = []



class TextScript:
    def __init__(self, units: list, archive_idx: int, addr: int, size: int):
        """
        :param units: list of textscript elements: GameString and TextScriptCommand
        :param archive_idx: represents the index of the TextScript in its container TextScriptArchive
        :param addr: the base address of the textscript
        :param size: the size of the text script
        """
        self.units = units
        self.archive_idx = archive_idx
        self.addr = addr
        self.size = size

    @staticmethod
    def read(bin_file, size: int, archive_idx: int, sects, sects_s):
        """
        reads a textscript segment that terminates with E6 or has a known size
        :param bin_file: binary file stream to read the file from
        :param size: if None, this is computed as the text script is parsed, and size is determined
                     at the first occurance of an E6 (or termination command)
        :param sects: list of command dictionaries using the regular interpreter
        :param sects_s: list of command dictionaries using the secondary interpreter
        :return: TextScript object representation
        """
        addr = bin_file.tell()

        def in_script(bin_file, byte, size: int) -> bool:
            """
            checks if the script has ended by checking for the current presence of an end_script command, or
            if the script size has been reached
            :param bin_file: the file reading the bytecode from
            :param byte: current byte in the bytecode
            :param size: size of the textscript
            :return: true if we haven't reached the end of this textscript
            """
            if not size: # zero or None
                return byte != b'\xE6'
            else:
                return byte != b'\xE6' and bin_file.tell() < addr + size

        def is_valid_game_string_char(byte) -> bool:
            return byte is not b'' and (ord(byte) < 0xE5 or ord(byte) == 0xE6 or ord(byte) == 0xE9)

        # process TextScript units (commands or strings)
        byte = bin_file.read(1)
        units = []  # text script discrete string/cmd units
        while True:
            def read_string_lines(bin_file, byte, size):
                out = []
                string = b''
                # we need to force shut this down, due to the rare case of scripts ending mid-string...
                while in_script(bin_file, byte, size) and is_valid_game_string_char(byte):
                    # not a command, process string
                    string = string + byte
                    if ord(byte) == 0xE9:
                        # separate strings by line
                        out.append(GameString(string))
                        string = b''
                    byte = bin_file.read(1)

                # a string may contain an end_script character, even though it terminates our search
                if byte == b'\xE6':
                    string = string + byte

                if string != b'':
                    out.append(GameString(string))

                return out, byte

            # TODO check: is this a valid check?
            if byte == b'':
                error(TextScriptException, 'error: reached end of file before script end', critical=True)
                break

            if is_valid_game_string_char(byte):
                # read strings, which may be multiple line-separated units
                strings, byte = read_string_lines(bin_file, byte, size)
                if strings is not []:
                    units.extend(strings)
                    # make sure we didn't encounter an end_script command, otherwise our unit processing is over
                    if byte == b'\xE6':
                        break
                    # if a command comes right after the text in the same script, it needs to be parsed as well
                    # read_string_lines already advanced to the command byte, so it has to be interpreted too, next iteration.
                    elif byte > b'\xE6':
                        continue
            else:
                # read current bytecode command
                units.append(TextScriptCommand.read(bin_file, byte, sects, sects_s,
                                                    TextScriptCommand.guess_interpreter(bin_file, byte)))

            # do while the script has not ended
            if not in_script(bin_file, byte, size):
                break
            byte = bin_file.read(1)

        # compute size if it was not provided
        if size is None:
            size = bin_file.tell() - addr

        return TextScript(units, archive_idx, addr, size)

    def build(self) -> str:
        """
        builds the TextScript into a text format
        """
        out = '\ttext_script {0}, scr_{0}\n'.format(self.archive_idx)

        # build units
        for unit in self.units:
            if type(unit) is GameString:
                if len(unit.data) == 1 and unit.data[0] == 0xE6:
                    # for empty scripts, we just put the end script command instead of representing it as an empty string
                    s = TextScriptCommand.get_cmd_macro(unit.data, b'', self.sects, self.sects_s, False)
                else:
                    s = '.string "%s"' % unit.to_string()
                if s == '':
                    raise TextScriptException('invalid string output for %s' % unit)
                out += '\t' + s
            elif type(unit) is TextScriptCommand:
                name = unit.macro
                s = '%s ' % name
                for i in range(len(unit.params)):
                    # jump commands go to a linked script
                    if 'jump' in name.lower() and i == 0:
                        s += '%d, ' % unit.params[i]
                    else:
                        s += '0x%X, ' % unit.params[i]
                if unit.params: s = s[:-2]
                s = s.rstrip()
                if s == '':
                    raise TextScriptException('invalid string output for %s' % unit)
                out += '\t' + s
            else:
                raise TextScriptException('invalid unit type')

        return out

    def serialize(self) -> bytes:
        out = b''
        # compile data
        for unit in self.units:
            if type(unit) == GameString:
                # game string
                out += unit.data
            elif type(unit) == TextScriptCommand:
                out += unit.serialize()
            else:
                raise TextScriptException('invalid unit type')
        return out

    def get_unit_at(self, base_idx, idx):
        cur_idx = base_idx
        prev_idx = cur_idx
        prev_unit = self.units[0]
        for unit in self.units:
            if type(unit) != int:
                if prev_idx < idx < cur_idx:
                    return prev_unit, prev_idx
                if idx == cur_idx:
                    return unit, cur_idx
                prev_idx = cur_idx
                prev_unit = unit
                if type(unit) is GameString:
                    cur_idx += len(unit.data)
                elif type(unit) is TextScriptCommand:
                    cur_idx += len(unit.cmd) + len(unit.params)
                else:
                    raise InvalidTextScriptCommandException('invalid unit detected: %s' % unit)
        return None


class TextScriptArchive:
    def __init__(self, rel_pointers: list, text_scripts: list, addr: int, size: int, sects: list, sects_s: list):
        self.rel_pointers = rel_pointers
        self.text_scripts = text_scripts
        self.addr = addr
        self.size = size
        self.sects = sects
        self.sects_s = sects_s


    def serialize(self) -> bytes:
        out = b''
        # since rel. pointers are hwords, a \x00 has to be appended if the pointer is < 0xFF
        for b in self.rel_pointers:
            if b > 0xFF:
                out += bytes([b & 0xFF, b >> 8])
            else:
                out += bytes([b, 0x00])
        # serialize scripts
        for text_script in self.text_scripts:
            out += text_script.serialize()
        return out

    def build(self) -> str:
        """
        :return: the text script archive as a string
        """
        out = '\ttext_script_start unk_%X // TODO: change this if label is named different\n' % self.addr

        # assign unique ids to each pointer for reference
        rel_pointer_ids = {}
        last_pointer = 0
        i = 0
        for p in sorted(self.rel_pointers):
            if p != last_pointer:
                rel_pointer_ids[p] = i
                i += 1
            last_pointer = p

        # build rel. pointer macros
        rel_pointers_macro = ''
        item_idx = 0
        for i, p in enumerate(self.rel_pointers):
            # new macro every 16 items
            if item_idx % 16 == 0:
                if len(rel_pointers_macro) > 2:
                    rel_pointers_macro = rel_pointers_macro[:-2]
                rel_pointers_macro += '\n\ttext_script_rel_pointers '
            rel_pointers_macro += '%d, ' % i
            item_idx += 1
        rel_pointers_macro = rel_pointers_macro[:-2] # remove tail ', '
        out += rel_pointers_macro + '\n'

        # build text scripts
        for text_script in self.text_scripts:
            out += text_script.build() + '\n'

        # text scripts are always aligned by 4
        out += '\n\t.balign 4, 0'

        return out

    def get_unit_at(self, idx):
        cur_idx = 2 * len(self.rel_pointers)
        prev_idx = cur_idx
        for script in self.text_scripts:
            out = script.get_unit_at(cur_idx, idx)
            if out is not None:
                return out
            # advance idx
            cur_idx += script.size
        return None


    @staticmethod
    def read_relative_pointers(bin_file, address: int) -> list:
        def read_hword(bin_file) -> int:
            bytes = bin_file.read(2)
            return bytes[0] + (bytes[1] << 8)

        # assuming first relative pointer is first script
        size_rel_pointers = read_hword(bin_file)
        rel_pointers = [size_rel_pointers]
        while bin_file.tell() < address + size_rel_pointers:
            rel_pointers.append(read_hword(bin_file))
        return rel_pointers

    @staticmethod
    def read(bin_file, sects, sects_s, size: int=None) -> 'TextScriptArchive':
        """
        :param bin_file: binary file stream to read the file from
        :param sects: list of command dictionaries using the regular interpreter
        :param sects_s: list of command dictionaries using the secondary interpreter
        :param size: if not None, the script archive will end at the specified size
        :return: TextScriptArchive object representation
        """
        address = bin_file.tell()
        rel_pointers = TextScriptArchive.read_relative_pointers(bin_file, address)
        last_script_pointer = max(rel_pointers)

        scripts = []
        for i, ptr in enumerate(rel_pointers):
            # determine size of script, if known
            if i < len(rel_pointers)-1:
                size = rel_pointers[i+1] - ptr
            else:
                size = None

            # make sure when reading each script that we reached its location
            if bin_file.tell() == ptr:
                if size == 0:
                    scripts.append(TextScript([], i, ptr, 0))
                else:
                    scripts.append(TextScript.read(bin_file, size, i, sects, sects_s))
            else:
                pass
                # invalid state
                # TODO refactor: to TextScriptError
                raise TextScriptException('invalid state: reading a script in a different location from its pointer {0} != {1}'
                                          .format(hex(bin_file.tell()), hex(ptr)))

        # create Script object
        return TextScriptArchive(rel_pointers, scripts, address, bin_file.tell() - address, sects, sects_s)


    @staticmethod
    def read_script(ea: int, bin_file, ini_path, size: int=None) -> 'TextScriptArchive':
        # ensure ea is file relative
        ea &= ~0x8000000
        bin_file.seek(ea)

        if not ini_path.endswith('/'):
            ini_path += '/'

        error.list = []
        sects = read_custom_ini(ini_path + 'mmbn6.ini')
        sects_s = read_custom_ini(ini_path + 'mmbn6s.ini')
        return TextScriptArchive.read(bin_file, sects, sects_s, size)


class TextScriptCommand:
    def __init__(self, cmd: bytes, params: bytes, with_interpreter_s: bool, macro: str):
        """
        :param cmd: bytes representing the base part of the command
        :param params: bytes representing the parameters. Bitwise params are an exception to this, in which
        they have to be combined according to a mask rule, not just a simple concatenation
        :param with_interpreter_s: flag that specifies if this runs on the secondary interpreter
        running outside the dialog box.
        """
        self.cmd = cmd
        self.params = params
        self.with_interpreter_s = with_interpreter_s
        self.macro = macro
        self.size = self.get_cmd_len(cmd, params, with_interpreter_s)

    def serialize(self):
        if self.cmd[0:2] == b'\xfa\x00':
            # have to put the params back into the command
            cmd_bytes = list(self.cmd)
            param_bytes = list(self.params)
            cmd_bytes[2] |= param_bytes[0] << 4
            cmd_bytes[2] |= param_bytes[1] >> 4
            cmd_bytes[3] |= (param_bytes[1] & 0xF) << 4
            compiled_cmd = bytes(cmd_bytes)
        else:
            compiled_cmd = bytes(self.cmd) + bytes(self.params)

        if len(compiled_cmd) != self.size:
            raise TextScriptException(
                'compiling command failed due to its length not matching: %s' % (compiled_cmd))
        return compiled_cmd

    @staticmethod
    def read(bin_file, cmd: bytes, sects, sects_s, with_interpreter_s) -> 'TextScriptCommand':
        """
        use guess_interpreter to determine likely value of with_interpreter_s.
        with_interpreter_s is the distinction between dilog and visual commands.
        """
        """
        attempts to read the command on both interpreters, given priority
        """
        select_sects = lambda select: [sects, sects_s][select]
        out = TextScriptCommand.read_cmd_from_sects(bin_file, cmd, select_sects(with_interpreter_s))
        interpreter_used = with_interpreter_s
        if not out:
            out = TextScriptCommand.read_cmd_from_sects(bin_file, cmd, select_sects(not with_interpreter_s))
            interpreter_used = not with_interpreter_s
        if not out:
            raise InvalidTextScriptCommandException(
                  'invalid cmd %s detected at 0x%x' % (cmd, bin_file.tell()))
        return TextScriptCommand(out[0], out[1], interpreter_used,
                                 TextScriptCommand.get_cmd_macro(out[0], out[1], sects, sects_s, interpreter_used))

    @staticmethod
    def guess_interpreter(bin_file, cmd: bytes) -> bool:
        # read command, this can be using either interpreters, but sometimes it can lead to conflicts
        if cmd in ModuleState.CONFLICT_CMDS:
            # check if there's a 0xFF in the hypothetical parameters of the command, this is a way
            # to tell if this a ts_check_global or ts_check_game_version
            if cmd == b'\xef':
                if b'\xff' in bin_file.read(5):
                    bin_file.seek(bin_file.tell() - 5)  # rewind
                    return False
                else:
                    return True
            else:
                return False
        else:
            return True

    @staticmethod
    def find_valid_cmd_base(cmd: bytes, sects) -> (bool, dict):
        for sect in sects:
            if TextScriptCommand.valid_cmd_base(cmd, sect):
                return True, sect
        return False, None

    @staticmethod
    def valid_cmd_base(cmd: bytes, sect: dict) -> bool:
        if sect['section'] not in ['Command', 'Extension']:
            return False
        cmd_bytes = list(cmd)
        mask = [int(b, 16) for b in sect['mask'].split(' ')]
        base = [int(b, 16) for b in sect['base'].split(' ')]
        # must contain enough information for the base
        if len(cmd_bytes) < len(base):
            return False
        # clear cmd_bytes by mask to remove parameters
        for i in range(len(base)):
            cmd_bytes[i] &= mask[i]

        # if it's a priority command, then it can have more bytes than base
        if cmd_bytes[0] == 0xF0:
            return cmd_bytes[:len(base)] == base
        # confirm it matches with the base
        return len(cmd_bytes) == len(base) and cmd_bytes[:len(base)] == base

    @staticmethod
    def get_param_count(cmd: bytes, sect: dict):
        if sect['section'] in ['Command', 'Extension']:
            if TextScriptCommand.valid_cmd_base(cmd, sect):
                nzeros = sect['mask'].count('0')
                if nzeros % 2 == 0:
                    return nzeros // 2
                elif len(cmd) > 2 and cmd[0:2] == b'\xfa\x00' and nzeros == 3:
                    # weird bitfield case... only 3 zeros are supported
                    return 1.5
                else:
                    raise NotImplemented('multiple bitfield paramters are unsupported')
        return -1

    @staticmethod
    def find_param_count(cmd: bytes, sects: list):
        """
        mostly, the number of parameters is simply the number of unmasked bytes if the command
        matches. This is not true for odd numbers of zero nibbles: bitfield paramters.
        An assumption is made that the smallest field always comes first.
        So 00 0F would be 2 fields, a 4-bit field x and 8-bit field y: xy yF
        :raises NotImplemented: for multiple bitfield paramaters
        """
        for sect in sects:
            num_params = TextScriptCommand.get_param_count(cmd, sect)
            if num_params != -1:
               return num_params, sect
        return -1, None

    @staticmethod
    def valid_cmd(cmd: bytes, params: bytes, sect) -> bool:
        if sect['section'] in ['Command', 'Extension']:
            # ensure parameters match, unless it's a command with dynamic parameters
            valid_params = lambda: bytes(cmd) in ModuleState.DYNAMIC_CMDS or len(params) == TextScriptCommand.get_param_count(cmd, sect) \
                                   or TextScriptCommand.get_param_count(cmd, sect) == 1.5
            if TextScriptCommand.valid_cmd_base(cmd, sect) and valid_params():
                return True
        return False

    @staticmethod
    def find_cmd(cmd: bytes, params: bytes, sects: list) -> dict or None:
        for sect in sects:
            if TextScriptCommand.valid_cmd(cmd, params, sect):
                return sect
        return None

    @staticmethod
    def convert_cmd_name(name: str) -> str:
        name = 'ts_' + name
        # convert to snake case
        for c in name:
            if c.isupper():
                name = name.replace(c, '_%c' % c.lower())
        return name

    @staticmethod
    def get_cmd_len(cmd: bytes, params: bytes, from_sect_s: bool) -> int:
        # 0xFA bitfield commands span have parameters in base length
        if cmd[0:1] == b'\xfa' and cmd[0:2] == b'\xfa\x00' and len(cmd) == 4 and not from_sect_s:
            return len(cmd)
        else:
            return len(cmd) + len(params)

    @staticmethod
    def get_cmd_macro(cmd: bytes, params: bytes, sects: dict, sects_s: dict, prioritize_s: bool) -> str:
        """
        gets the command macro given a full description of the command (all bytes involving the set mask)
        :param sects: array of dictionaries representing ini specs of commands
        :param cmd: byte array that must contain at least
        :param sects_s: for commands running the alternatsects.erpreter. This is always prioritized over sects.
        :return: string representing the macro for the command
        """
        select_sects = lambda select: [sects, sects_s][select]
        sect = TextScriptCommand.find_cmd(cmd, params, select_sects(prioritize_s))
        if not sect:
            sect = TextScriptCommand.find_cmd(cmd, params, select_sects(not prioritize_s))
        if not sect:
            error(InvalidTextScriptCommandException,
                  'could not find command %s %s' % (str(cmd), str(params)),
                  critical=False)
        name = TextScriptCommand.convert_cmd_name(sect['name']) # converts to snake case and add ts_
        if not name:
            error(InvalidTextScriptCommandException,
                  'no name exists for the cmd ' + str(cmd) + ' ' + str(params),
                  critical=False)
            name = '.byte '
            for b in cmd:
                name += hex(b) + ', '
            if name.endswith(', '):
                name = name[:-2]
            name += ' // ***ERROR***'
        return name.strip()

    @staticmethod
    def read_cmd_from_sects(bin_file, cmd: bytes, sects: list) -> (bytes, bytes) or None:
        """
        if this function fails to read a valid command, it rewinds the bin_file
        :param bin_file: bin file to read the command from
        :param cmd: first byte of the command
        :param sects: sections to use to identify the command
        :return: cmd, params if found or None
        """
        rewind_addr = bin_file.tell()
        num_params = -1

        # some commands are prioritized by their input (really just jump_random)
        # so, automatically get the input to determine if it's really that command, or another one
        # (like jump)
        if cmd in ModuleState.PRIORITY_CMDS:
            cmd += bin_file.read(1)
        for i in range(4):  # max number of base bytes per command
            num_params, sect = TextScriptCommand.find_param_count(cmd, sects)
            if num_params >= 0:
                break
            else:
                byte = bin_file.read(1)
                cmd = cmd + byte


        # valid command found
        if num_params >= 0:
            # no priority commands, go with default (jump_random)
            if cmd[0:1] in ModuleState.PRIORITY_CMDS and cmd[1] >= 3:
                params = cmd[1:2]
                cmd = cmd[:1]
            # bitfield commands, prints
            elif num_params == 1.5:
                # params are already part of the command
                # pattern: FF FF ... FF 00 0F
                params = bytes([cmd[2] >> 4, ((cmd[2]<<4)&0xFF)|(cmd[3]>>4)])  # X0 0, 0X X
                cmd = bytes([cmd[0], cmd[1], 0x00, cmd[3]&0xF])
            # parse cmd and params
            elif num_params >= 0:
                params = bin_file.read(num_params)
            # command not detected
            else:
                params = []
                error(InvalidTextScriptCommandException, 'invalid num_parameters states detected at %s' % cmd)

            # edge case: select command is dynamic. assumed dynamic until it encounters a command or after
            # 3 additional parameters. Values allowed are <E5 and FF
            if cmd[0:1] in ModuleState.DYNAMIC_CMDS:
                for i in range(3):
                    byte = bin_file.read(1)
                    if byte != b'\xff' and byte >= b'\xe5':
                        # rewind, doesn't belong to this dynamic command
                        bin_file.seek(bin_file.tell() - 1)
                        break
                    else:
                        params += byte

            return cmd, params
        else:
            # no command found
            bin_file.seek(rewind_addr)
            return None


class GameString:
    def __init__(self, byte_data, tbl_path=ModuleState.TBL_PATH):
        self.data = byte_data
        self.tbl_path = tbl_path
        self.text = self.to_string()

    def to_string(self):
        return GameString.bn6f_str(self.data, GameString.get_tbl(self.tbl_path))

    @staticmethod
    def get_tbl(path):
        if 'tbl' in GameString.get_tbl.__dict__.keys():
            return GameString.get_tbl.tbl
        tbl = []
        with open(path, 'r', encoding='utf-8') as f:
            for line in f.readlines():
                if '=' in line:
                    lhs = line[:line.index('=')].strip()
                    rhs = line[line.index('=') + 1:].strip()
                    if rhs == '': rhs = ' '  # space would be filtered out
                    if len(lhs) == 2:
                        tbl.append(rhs)
                    elif lhs == 'E400':
                        tbl.append(' ')
                        break
        for i in range(len(tbl), 0xEA):
            tbl.append('\\x%X' % i)

        tbl[0xE6] = '$' # for shortness, represent the end of script as a '$' in strings
        tbl[0xE9] = '\\n'
        GameString.get_tbl.tbl = tbl

        return tbl

    @staticmethod
    def bn6f_str(byte_arr, tbl):
        out = ''
        for byte in byte_arr:
            # byte code
            if byte > len(tbl):
                break
            if tbl[byte] == '"':
                out = out + '\\"'
            else:
                out = out + tbl[byte]
        return out


def read_custom_ini(ini_path: str) -> list:
    # type: (str) -> list(dict(str, str))
    sections = []
    with open(ini_path, 'r') as ini_file:
        for line in ini_file.readlines():
            # section
            if line.startswith('[') and ']' in line:
                sections.append({})
                sections[-1]['section'] = line[line.index('[') + 1:line.index(']')]
            elif '=' in line:
                key = line[:line.index('=')].strip()
                val = line[line.index('=') + 1:].strip()
                sections[-1][key] = val
    return sections

def gen_macros(config_ini_path):
    sects = read_custom_ini(config_ini_path)
    # TODO: generate correct dynamic ts_select
    macros = ''
    for sect in sects:
        if sect['section'] in ['Command', 'Extension']:
            base = []
            mask = []
            for b in sect['base'].split(' '): base.append(int(b, 16))
            for b in sect['mask'].split(' '): mask.append(int(b, 16))
            name = 'ts_'  + sect['name']
            # convert to snake case
            for c in name:
                if c.isupper():
                    name = name.replace(c, '_%c' % c.lower())
            # figure out how many parameters
            params = ''
            i = 0
            for b in mask:
                if b != 0xFF:
                    params += 'p%d:req, ' % i
                    i += 1
            if params.endswith(', '): params = params[:-2]
            macros += '.macro %s %s\n' % (name, params)
            # define base bytes
            bytes = '.byte '
            for b in base:
                bytes += '0x%X, ' % b
            bytes += params.replace('p', '\p').replace(':req', '')
            if bytes.endswith(', '): bytes = bytes[:-2]
            macros += '\t' + bytes + '\n'
            macros += '.endm\n'
    return macros

if __name__ == '__main__':
    import codecs
    import argparse

    def auto_int(i):
        return int(i, 0)

    # usage: text_script_dumper.py [-h] [-f FILE] [-i INI_DIR] address
    parser = argparse.ArgumentParser(description='TextScript dumper for Megaman Battle Network')
    parser.add_argument('address', type=auto_int, help='address of text script archive in file')
    parser.add_argument('-f', '--file', help='file to parse from, likely the ROM.')
    parser.add_argument('-i', '--ini_dir', help='directory of command database ini files to use')
    parser.add_argument('-s', '--size', type=auto_int, help='the size of script, if known')
    args = parser.parse_args()

    # in case the default encoding doesn't support utf8
    sys.stdout = codecs.getwriter('utf8')(sys.stdout.buffer)

    # defaults
    if not args.file:
        args.file = ModuleState.ROM_PATH
    if not args.ini_dir:
        args.ini_dir = ModuleState.INI_DIR
    if args.ini_dir and args.ini_dir[-1] != '/':
        args.ini_dir = args.ini_dir + '/'

    def parse_script_size(val):
        words = val.split(' ')
        return int(words[0], 16), int(words[1], 16)

    # search for if address has a known size in config
    for key in ModuleState.config['ScriptSizes']:
        address, size = parse_script_size(ModuleState.config['ScriptSizes'][key])
        if address == args.address:
            args.size = size

    # '6C580C' # TextScriptChipTrader86C580C
    # '6C67E4' # TextScriptLottery86C67E4

    print(args)


    with open(args.file, 'rb') as f:
        out, end_addr = TextScriptArchive.read_script(args.address, f, args.ini_dir, args.size).display()
    for i in out:
        print(i)
    print(hex(end_addr))
    for e in error.list:
        print('error: ' + e)