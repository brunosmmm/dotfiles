"""Git manipulation."""

import os
import subprocess
from . import exceptions
from .misc import files_differ, git_diff


class GitDotfileInspector:
    """Inspect git repository for dotfiles."""

    def __init__(self, path_to_dotfiles, home_path):
        """Initialize."""
        if not os.path.exists(path_to_dotfiles) or not os.path.isdir(
            path_to_dotfiles
        ):
            raise OSError("path is invalid or not a directory.")

        if not os.path.exists(home_path) or not os.path.isdir(home_path):
            raise OSError("path is invalid or not a directory.")

        self._dot_path = path_to_dotfiles
        self._home_path = home_path

    def inspect(self):
        """Inspect."""

        def delete_prefix(s, p):
            if s.startswith(p):
                return s[len(p) :]

        file_map = {}
        try:
            git_output = subprocess.check_output(
                ["git", "ls-files", self._dot_path]
            )
        except subprocess.CalledProcessError:
            raise exceptions.DotfileException("failed to list contents.")

        for fname in git_output.decode().split("\n"):
            if len(fname) < 1:
                continue
            subpath = delete_prefix(fname, self._dot_path).lstrip("/")
            subpath_split = os.path.split(subpath)
            if len(subpath_split[0]) < 1:
                leading_path = subpath_split[1]
            else:
                leading_path = subpath_split[0]

            # do some checking
            if os.path.isdir(os.path.join(self._dot_path, leading_path)):
                # directory structure stored here
                file_map[fname] = os.path.join(
                    self._home_path, "." + leading_path, *subpath_split[1:]
                )
            else:
                # file
                if leading_path.startswith("dot."):
                    # dotfile
                    file_map[fname] = os.path.join(
                        self._home_path,
                        ".{}".format(delete_prefix(leading_path, "dot.")),
                    )

        return file_map

    def determine_changes(self):
        """Determine which files have changed."""
        file_map = self.inspect()

        changed_files = {}
        for repo_file, user_file in file_map.items():
            if not os.path.exists(user_file):
                continue
            if files_differ(repo_file, user_file):
                changed_files[repo_file] = user_file

        return changed_files

    def diff_file(self, fname):
        """Get diff."""
        file_map = self.inspect()
        if not fname.startswith(self._dot_path):
            dot_fname = os.path.join(self._dot_path, fname)
        else:
            dot_fname = fname

        if dot_fname not in file_map:
            # try to do a reverse-lookup
            found = False
            for repo_file, user_file in file_map.items():
                if user_file == fname:
                    dot_fname = repo_file
                    found = True
                    break
        else:
            found = True

        if found is False:
            if not os.path.exists(fname):
                raise RuntimeError(f"file does not exist: '{fname}'")
            else:
                raise RuntimeError(f"file is not monitored: '{fname}'")

        if files_differ(dot_fname, file_map[dot_fname]):
            return git_diff(file_map[dot_fname], dot_fname)
        else:
            return ""
