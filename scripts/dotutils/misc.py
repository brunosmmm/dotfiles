"""Miscellaneous utilities."""

import os
import subprocess


def _check_input_files(fn):
    """Check input files."""

    def wrapper(path_a, path_b):
        """Verify."""
        if not os.path.exists(path_a):
            raise RuntimeError('file "{}" does not exist'.format(path_a))

        if not os.path.exists(path_b):
            raise RuntimeError('file "{}" does not exist'.format(path_b))

        if not os.path.isfile(path_a):
            raise RuntimeError('"{}" is not a file'.format(path_a))

        if not os.path.isfile(path_b):
            raise RuntimeError('"{}" is not a file'.format(path_b))

        return fn(path_a, path_b)

    return wrapper


@_check_input_files
def files_differ(path_a, path_b):
    """Check whether files differ."""
    try:
        subprocess.check_call(
            ["diff", "-q", path_a, path_b],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
    except subprocess.CalledProcessError as ex:
        if ex.returncode == 1:
            return True
        else:
            # error
            raise RuntimeError("diff failed")

    return False


@_check_input_files
def git_diff(path_a, path_b):
    """Get git diff output."""
    try:
        ret = subprocess.run(
            ["git", "diff", path_a, path_b],
            stderr=subprocess.DEVNULL,
            stdout=subprocess.PIPE,
            check=True,
        )
    except subprocess.CalledProcessError as ex:
        if ex.returncode == 1:
            return ex.stdout.decode()
        else:
            raise RuntimeError("diff failed")
