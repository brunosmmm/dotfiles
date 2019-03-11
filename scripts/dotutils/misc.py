"""Miscellaneous utilities."""

import os
import subprocess


def files_differ(path_a, path_b):
    """Check whether files differ."""

    if not os.path.exists(path_a):
        raise RuntimeError('file "{}" does not exist'.format(path_a))

    if not os.path.exists(path_b):
        raise RuntimeError('file "{}" does not exist'.format(path_b))

    if not os.path.isfile(path_a):
        raise RuntimeError('"{}" is not a file'.format(path_a))

    if not os.path.isfile(path_b):
        raise RuntimeError('"{}" is not a file'.format(path_b))

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
