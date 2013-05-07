# -*- coding:utf-8 -*-

import os

from fuzzyfinder import settings as fuzzymatcher_settings

__all__ = (
    'ProjectsFinder',
    'FilesFinder',
    'DirsFinder',
)


class Finder(object):
    results = []

    def find(self, parentdir):
        raise NotImplementedError()


class ProjectsFinder(Finder):
    def find(self, parentdir):
        self.results = []
        return self.find_projects(parentdir)

    def find_projects(self, parentdir):
        dirs = self.get_subdirectories(parentdir)
        for directory in dirs:
            if self.is_project_dir(directory):
                self.results.append(directory)
            else:
                self.find_projects(directory)

        results = set(self.results) - set(fuzzymatcher_settings.IGNORE_DIRS)
        self.results = list(results)

        self.results += fuzzymatcher_settings.DEFAULT_RESULT_DIRS
        return self.results

    def is_project_dir(self, directory):
        is_project_dir = False
        for detect_file in fuzzymatcher_settings.DETECT_FILES:
            is_project_dir = is_project_dir or os.path.exists(os.path.join(directory, detect_file))

        return is_project_dir

    def get_subdirectories(self, parentdir):
        dirs = []
        for directory in os.listdir(parentdir):
            path = os.path.join(parentdir, directory)
            if os.path.isdir(path):
                dirs.append(path)

        return dirs


class FilesFinder(Finder):
    def find(self, parentdir):
        self.results = []
        return self.find_files(parentdir)

    def find_files(self, parentdir):
        for root, dirs, files in os.walk(parentdir):
            for filename in files:
                self.results.append(os.path.join(root, filename))

        return self.results


class DirsFinder(Finder):
    def find(self, parentdir):
        self.results = []
        return self.find_dirs(parentdir)

    def find_dirs(self, parentdir):
        for root, dirs, files in os.walk(parentdir):
            for directory in dirs:
                self.results.append(os.path.join(root, directory))

        return self.results
