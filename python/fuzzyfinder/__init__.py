# -*- coding:utf-8 -*-

import os

__all__ = (
    'settings',
)


HOME_DIR = os.environ.get('HOME')


default_settings = {
    'DEFAULT_PARENTDIR': os.path.abspath('.'),
    'DETECT_FILES': (
        '.svn',
        '.git',
        '.venvrc',
    ),

    'DEFAULT_RESULT_DIRS': (
        os.path.join(HOME_DIR, 'workspace', 'full_web', 'wgnp', 'trunk'),
        os.path.join(HOME_DIR, 'workspace', 'full_web', 'wgni', 'trunk'),
        os.path.join(HOME_DIR, 'workspace', 'full_web', 'wgnr', 'trunk'),

        os.path.join(HOME_DIR, 'workspace', 'full_web2', 'wgnp', 'trunk'),
        os.path.join(HOME_DIR, 'workspace', 'full_web2', 'wgni', 'trunk'),
        os.path.join(HOME_DIR, 'workspace', 'full_web2', 'wgnr', 'trunk'),
    ),

    'IGNORE_DIRS': (
        os.path.join(HOME_DIR, 'workspace', 'venv'),
    ),
}


# TODO: check works with arrays, dict & etc
class Settings(object):
    def __init__(self):
        for k, v in default_settings.iteritems():
            setattr(self, k, os.environ.get('FUZZYMATCHER_%s' % k, v))

settings = Settings()


for dir in settings.DEFAULT_RESULT_DIRS:
    if not os.path.exists(dir):
        raise ValueError('%s is not exists! (repair DEFAULT_RESULT_DIRS)' % dir)
