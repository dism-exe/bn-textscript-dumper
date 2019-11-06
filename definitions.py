import os

# path to this project
ROOT_DIR = os.path.dirname(os.path.abspath(__file__))

# path to cache folder to cache results to disk.
CACHE_DIR = os.path.join(ROOT_DIR, '.cache/')

ROM_REPO_DIR = os.path.join(os.environ['HOME'], 'dev', 'dis', 'bn6f')
