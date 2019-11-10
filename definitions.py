import os

# path to this project
ROOT_DIR = os.path.dirname(os.path.abspath(__file__))

# path to cache folder to cache results to disk.
CACHE_DIR = os.path.join(ROOT_DIR, '.cache/')

ROM_NAME = 'bn6f'
ROM_REPO_DIR = os.path.join(os.environ['HOME'], 'dev', 'dis', 'bn6f')


# for non-compressed text scripts that must have their size specified
SCRIPT_SIZES = {
    # TextScriptLottery86C67E4
    0x6C67E4: 0x34c,
    # TextScriptNaviCustDialog
    0x6D5708: 0xf10,
}
