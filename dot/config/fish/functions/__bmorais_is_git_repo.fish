function __bmorais_is_git_repo -a repopath -d "Check whether is a git repository."
    if test -z "$repopath"
        return 0
    end
    #check if directory exists
    if not test -d "$repopath"
        return 0
    end
    # call git directly
    git -C "$repopath" rev-parse --show-toplevel 2> /dev/null 1> /dev/null
    if test "$status" != 0
        # failed
        return 0
    end
    return 1
end
