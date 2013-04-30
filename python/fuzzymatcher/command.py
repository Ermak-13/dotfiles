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
        self.check_args(options, arguments)

        self.options = options

        self.pattern = arguments[0]
        print fuzzymatcher_settings.DEFAULT_PATH
        self.parentdir = arguments[1] if len(arguments) >= 2 else fuzzymatcher_settings.DEFAULT_PATH

        results = self.choose_finder().find(self.parentdir)
        print process.extract(self.pattern, results, limit=fuzzymatcher_settings.LIMIT)

    def check_args(self, options, arguments):
        if (options.only_dirs + options.only_files + options.only_projects) > 1:
            raise ValueError('--only-dirs & --only-files flags are specified together.')

        if len(arguments) <= 0:
            raise ValueError('arguments are not specified.')

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
