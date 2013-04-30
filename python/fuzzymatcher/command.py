# -*- coding:utf-8 -*-

from optparse import OptionParser, make_option
from fuzzywuzzy import process

from fuzzymatcher import settings as fuzzymatcher_settings
from fuzzymatcher.logic import ProjectsFinder, DirsFinder, FilesFinder


class Command(object):
    parser = OptionParser(option_list=[
        make_option('-d', '--only-dirs',
            action='store_true',
            dest='only_dirs',
            default=False),
        make_option('-f', '--only-files',
            action='store_true',
            dest='only_files',
            default=False),
        make_option('-p', '--only-projects',
            action='store_true',
            dest='only_projects',
            default=False)
    ])

    def run(self):
        (options, arguments) = self.parser.parse_args()

        self.options = options
        self.arguments = arguments

        self.check_args()

        results = self.choose_finder().find()
        print process.extract(arguments[0], results, limit=fuzzymatcher_settings.LIMIT)

    def check_args(self):
        if (self.options.only_dirs + self.options.only_files + self.options.only_projects) > 1:
            raise ValueError('--only-dirs & --only-files flags are specified together.')

        if len(self.arguments) <= 0:
            raise ValueError('file pattern are not specified.')

    def choose_finder(self):
        if self.options.only_projects:
            return ProjectsFinder()

        if self.options.only_dirs:
            return DirsFinder()

        if self.options.only_files:
            return FilesFinder()


if __name__ == '__main__':
    command = Command()
    command.run()
