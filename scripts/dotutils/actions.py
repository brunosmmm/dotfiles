"""File actions."""

import os
import shutil
from dotutils.git import GitDotfileInspector, DotFileNotMonitoredError
from dotutils.postactions import POST_ACTION_MGR, PostActionMgr
from dotutils.messages import warning, info, message, input


def update_file(src, dest, direction):
    """Update a file."""

    if direction not in ("home", "repo"):
        raise ValueError("direction must be either home or repo")

    shutil.copyfile(src, dest, follow_symlinks=False)

    ret = POST_ACTION_MGR.decide_postaction(
        PostActionMgr.POSTACTION_UPDATE, src, dest, direction
    )
    for idx, retval in enumerate(ret):
        if retval is False:
            # this post-action failed
            name, _ = POST_ACTION_MGR.get_postaction_description(
                PostActionMgr.POSTACTION_UPDATE, idx
            )
            warning(f"postaction '{name}' failed for file '{dest}'")


def update_all(changes, direction, install_new=False):
    """Update all files."""
    for repo_file, (user_file, new_file) in changes.items():
        if os.path.islink(repo_file):
            # leave symlinks alone
            continue
        if not new_file or (new_file and install_new):
            update_file(user_file, repo_file, direction)

    ret = POST_ACTION_MGR.decide_postaction(
        PostActionMgr.POSTACTION_UPDATE_ALL
    )
    for idx, retval in enumerate(ret):
        if retval is False:
            name, _ = POST_ACTION_MGR.get_postaction_description(
                PostActionMgr.POSTACTION_UPDATE, idx
            )
            fname = user_file if direction == "home" else repo_file
            warning(f"postaction '{name}' failed for file '{fname}'")


def inspect(dot_path, home_path, fname, diff=False, direction="repo"):
    """Inspect a file and return diff."""
    ins = GitDotfileInspector(dot_path, home_path)
    try:
        _diff = ins.diff_file(fname, direction)
    except DotFileNotMonitoredError:
        return {
            "status": "err",
            "err": f"ERROR: file {fname} is not monitored",
        }
    except OSError as ex:
        return {"status": "err", "err": f"ERROR: {ex}"}

    if diff and _diff is not None:
        return {"status": "okay", "diff": _diff}
    elif diff is False:
        return {"status": "okay", "result": _diff is not None}


def update(
    dot_path,
    home_path,
    interactive=False,
    quiet=False,
    install_new=False,
    direction="repo",
):
    """Perform update."""
    ins = GitDotfileInspector(dot_path, home_path)
    if quiet is False:
        message("Checking for changes...")

    if direction not in ("repo", "home"):
        raise ValueError("direction must be either home or repo")
    changes = ins.changes if direction == "repo" else ins.reverse_changes

    if quiet is False:
        counted_changes = [
            changed
            for changed, new_file in changes.values()
            if new_file and install_new or new_file is False
        ]
        info(
            "{} files have changed{}".format(
                "No" if not counted_changes else len(counted_changes),
                "" if not counted_changes else ":",
            )
        )
    if not changes:
        # done
        exit(0)

    if quiet is False:
        for dest, (src, new_file) in changes.items():
            if interactive is True:
                if new_file is True and install_new is False:
                    # skip
                    continue
                if direction == "home" and new_file is True:
                    choice = input(f"{dest} (new) [ install (i)/skip (s) ]")
                    # replace i with u, all the same
                    choice = "u" if choice == "i" else "s"
                else:
                    choice = input(f"{dest} [ update (u)/skip (s)/diff (d) ]?")
                if choice == "u":
                    update_file(src, dest, direction)
                elif choice == "d":
                    message(ins.diff_file(dest, direction))
                    choice = input(f"{dest} [ update (u)/skip (s) ]?")
                    if choice == "u":
                        update_file(src, dest, direction)
                    else:
                        print("skipped")
                else:
                    print("skipped")
            else:
                message(dest)

    if interactive is True:
        # update already occurred
        exit(0)

    try:
        if direction == "home":
            choice = (
                input("Update home folder [ y / n ]")
                if quiet is False
                else "y"
            )
        else:
            choice = (
                input("Update repository? [ y / n ]")
                if quiet is False
                else "y"
            )
    except KeyboardInterrupt:
        print("")
        info("Aborted")
        exit(0)

    if choice == "y":
        # update
        update_all(changes, direction, install_new=install_new)
    else:
        info("Aborted")


def list_files(dot_path, home_path, machine=False):
    """ "List files."""
    ins = GitDotfileInspector(dot_path, home_path)
    ret = ins.inspect()
    if machine:
        print(ret)
    else:
        for repo_file, user_file in ret.items():
            message(f"{repo_file} -> {user_file}")
