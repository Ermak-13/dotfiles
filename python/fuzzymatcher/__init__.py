# -*- coding:utf-8 -*-

import os

__all__ = (
    'settings',
)


default_settings = {
    'DEFAULT_PATH': os.path.abspath('.'),
    'DETECT_FILES': ['.svn', '.git', '.venvrc'],
    'LIMIT': 10,
}


class Settings(object):
    def __init__(self):
        for k, v in default_settings.iteritems():
            setattr(self, k, os.environ.get('FUZZYMATCHER_%s' % k, v))

settings = Settings()
