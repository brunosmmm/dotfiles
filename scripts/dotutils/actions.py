"""File actions."""

import os
import shutil
from dotutils.git import GitDotfileInspector
from dotutils.postactions import POST_ACTION_MGR, PostActionMgr


def update_file(user_file, repo_file, reverse=False):
    """Update a file."""
    if reverse:
        shutil.copyfile(repo_file, user_file, follow_symlinks=False)
    else:
        shutil.copyfile(user_file, repo_file, follow_symlinks=False)

    ret = POST_ACTION_MGR.decide_postaction(
        PostActionMgr.POSTACTION_UPDATE, user_file, repo_file, reverse
    )
    for idx, retval in enumerate(ret):
        if retval is False:
            # this post-action failed
            name, _ = POST_ACTION_MGR.get_postaction_description(
                PostActionMgr.POSTACTION_UPDATE, idx
            )
            fname = user_file if reverse else repo_file
            print(f"WARNING: postaction '{name}' failed for file '{fname}'")


def update_all(changes, reverse=False):
    """Update all files."""
    for repo_file, user_file in changes.items():
        if os.path.islink(repo_file):
            # leave symlinks alone
            continue
        update_file(user_file, repo_file, reverse)

    ret = POST_ACTION_MGR.decide_postaction(
        PostActionMgr.POSTACTION_UPDATE_ALL
    )
    for idx, retval in enumerate(ret):
        if retval is False:
            name, _ = POST_ACTION_MGR.get_postaction_description(
                PostActionMgr.POSTACTION_UPDATE, idx
            )
            fname = user_file if reverse else repo_file
            print(f"WARNING: postaction '{name}' failed for file '{fname}'")


def inspect(dot_path, home_path, fname, diff=False):
    """Inspect a file and return diff."""
    ins = GitDotfileInspector(dot_path, home_path)
    try:
        _diff = ins.diff_file(fname)
    except Exception:
        raise

    if diff and _diff is not None:
        return _diff
    elif diff is False:
        return _diff is not None


def update(
    dot_path, home_path, interactive=False, quiet=False, direction="repo"
):
    """Perform update."""
    ins = GitDotfileInspector(dot_path, home_path)
    if quiet is False:
        print("Checking for changes...")

    if direction not in ("repo", "home"):
        raise ValueError("direction must be either home or repo")
    changes = ins.changes if direction == "repo" else ins.reverse_changes
    reverse = direction == "home"

    if quiet is False:
        print(
            "{} files have changed{}".format(
                "No" if not changes else len(changes),
                "" if not changes else ":",
            )
        )
    if not changes:
        # done
        exit(0)

    if quiet is False:
        for dest, (src, new_file) in changes.items():
            if interactive is True:
                if reverse is True and new_file is True:
                    choice = input(f"{dest} (new) [install (i)/skip (s)]")
                    # replace i with u, all the same
                    choice = "u" if choice == "i" else "s"
                else:
                    choice = input(f"{dest} [update (u)/skip (s)/diff (d)]?")
                if choice == "u":
                    update_file(src, dest)
                elif choice == "d":
                    print(ins.diff_file(dest, reverse=reverse))
                    choice = input(f"{dest} [update (u)/skip (s)]?")
                    if choice == "u":
                        update_file(src, dest)
                    else:
                        print("skipped")
                else:
                    print("skipped")
            else:
                print(dest)

    if interactive is True:
        # update already occurred
        exit(0)

    choice = input("Update repository? [y/n]") if quiet is False else "y"

    if choice == "y":
        # update
        update_all(changes)
    else:
        print("Aborted")
