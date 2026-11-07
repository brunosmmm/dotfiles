function __project_is_git_repo -a repopath -d "Check whether is a git repository."
    if test -z "$repopath"
        return 1
    end
    if not test -d "$repopath"
        return 1
    end
    git -C "$repopath" rev-parse --show-toplevel &>/dev/null
end
