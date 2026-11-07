"""Post-action actions."""

import os
import re
import shlex
import subprocess
from typing import Any, Tuple, List, Optional
from dotutils.git import GitDotfileInspector


DEBUG = os.environ.get("DEBUG")


class PostActionError(Exception):
    """Post-action error."""


class PostAction:
    """Post-action."""

    NAME = ""
    DESCRIPTION = ""

    def will_act(self, *args, **kwargs) -> bool:
        """Get whether will act or not."""
        raise NotImplementedError

    def act(self, *args, **kwargs) -> bool:
        """Perform post-action."""
        raise NotImplementedError

    @property
    def description(self):
        """Get description."""
        return self.DESCRIPTION

    @property
    def name(self):
        """Get name."""
        return self.NAME


class UpdateAllPostAction(PostAction):
    """Update all post-action."""

    def will_act(self):
        """Decide if acting."""
        return True


class FileExtPostAction(PostAction):
    """File extension specific post-action."""

    def __init__(self, file_ext: str):
        """Initialize."""
        super().__init__()
        self._ext = file_ext

    @property
    def file_ext(self):
        """Get file extension."""
        return self._ext

    def _match_ext(self, file_name: str) -> bool:
        """Match file_ext regex against the suffix, with or without a leading dot."""
        _, ext = os.path.splitext(file_name)
        candidates = [ext]
        if ext.startswith("."):
            candidates.append(ext[1:])
        return any(re.fullmatch(self._ext, candidate) for candidate in candidates)

    def will_act(self, file_name: str) -> bool:
        """Decide if will act or not."""
        return self._match_ext(file_name)


class FileInstallPostAction(FileExtPostAction):
    """File install post-action."""

    def __init__(self, file_ext: str):
        """Initialize."""
        super().__init__(file_ext)

    def will_act(self, file_name: str, direction: str) -> bool:
        """Run when copying into the home directory."""
        if direction != "home":
            return False
        return super().will_act(file_name)


class FileUpdatePostAction(FileExtPostAction):
    """File update post-action."""

    def __init__(self, file_ext: str):
        """Initialize."""
        super().__init__(file_ext)

    def will_act(self, file_name: str, direction: str) -> bool:
        if direction == "repo":
            return super().will_act(file_name)
        return False


def make_shell_post_action(
    direction: str,
    file_ext: str,
    shell_cmd: str,
    post_action_name: Optional[str] = None,
    post_action_descr: Optional[str] = None,
) -> PostAction:
    """Make post-action which runs shell commands."""
    if direction not in ("update", "install"):
        raise ValueError("direction must be either update or install")

    if direction == "update":
        inherit_from = FileUpdatePostAction
    else:
        inherit_from = FileInstallPostAction

    if post_action_name is not None:
        if not isinstance(post_action_name, str):
            raise TypeError("post_action_name must be string")
        _name = post_action_name
    else:
        _name = "shell"

    if post_action_descr is not None:
        if not isinstance(post_action_descr, str):
            raise TypeError("post_action_descr must be string")
        _descr = post_action_descr
    else:
        _descr = "execute shell command"

    class ShellPostAction(inherit_from):
        """Shell post-action."""

        NAME = _name
        DESCRIPTION = _descr

        def __init__(self):
            """Initialize."""
            super().__init__(file_ext)

        def act(self, src: str, dest: str, fs_dir: str) -> bool:
            """Call shell command."""
            user_file = src if fs_dir == "repo" else dest
            repo_file = src if fs_dir == "home" else dest
            repo_path = GitDotfileInspector.get_repo_root(
                os.path.dirname(repo_file)
            )
            cmd = (
                shell_cmd.replace("${user_file}", user_file)
                .replace("${repo_path}", repo_path)
                .replace("${repo_file}", repo_file)
                .replace("${direction}", direction)
            )
            try:
                if DEBUG:
                    print(f"DEBUG: calling '{cmd}'")
                subprocess.check_call(shlex.split(cmd))
                return True
            except subprocess.CalledProcessError:
                return False

    return ShellPostAction()


class PostActionMgr:
    """Post-action manager."""

    POSTACTION_UPDATE = 0
    POSTACTION_UPDATE_ALL = 1

    POSTACTIONS: Tuple[int] = (POSTACTION_UPDATE, POSTACTION_UPDATE_ALL)

    def __init__(self):
        """Initialize."""
        self._post_actions_by_type = {
            PostActionMgr.POSTACTION_UPDATE: [],
            PostActionMgr.POSTACTION_UPDATE_ALL: [],
        }

    def _decide_postaction_update(
        self, src: str, dest: str, direction: str
    ) -> List[Optional[bool]]:
        """Decide postaction on update."""
        postaction_results = []
        for post_action in self._post_actions_by_type[self.POSTACTION_UPDATE]:
            if post_action.will_act(src, direction):
                postaction_results.append(post_action.act(src, dest, direction))
            else:
                postaction_results.append(None)
        return postaction_results

    def _postaction_update_all(self) -> List[bool]:
        """Update all postaction."""
        postaction_results = []
        for post_action in self._post_actions_by_type[
            self.POSTACTION_UPDATE_ALL
        ]:
            ret = post_action.act()
            postaction_results.append(ret)
        return postaction_results

    def decide_postaction(self, action: int, *args: Any) -> List[Optional[bool]]:
        """Decide which postaction to call based on files."""
        if action == self.POSTACTION_UPDATE:
            return self._decide_postaction_update(*args)
        if action == self.POSTACTION_UPDATE_ALL:
            return self._postaction_update_all()
        return []

    def register_postaction(self, action: int, post_action: PostAction):
        """Register new postaction."""
        if action not in self.POSTACTIONS:
            raise PostActionError("invalid post-action type")
        if not isinstance(post_action, PostAction):
            raise TypeError("post_action argument must be a PostAction object")

        if action not in self._post_actions_by_type:
            self._post_actions_by_type[action] = [post_action]
        else:
            self._post_actions_by_type[action].append(post_action)

        if DEBUG:
            name = post_action.name
            print(f"DEBUG: registered postaction '{name}'")

    def get_postaction_description(
        self, action_type: int, post_action_idx: int
    ) -> Tuple[str, str]:
        """Get postaction description."""
        if action_type not in self.POSTACTIONS:
            raise PostActionError("invalid post-action type")
        post_action = self._post_actions_by_type[action_type][post_action_idx]
        return (post_action.name, post_action.description)


POST_ACTION_MGR = PostActionMgr()
