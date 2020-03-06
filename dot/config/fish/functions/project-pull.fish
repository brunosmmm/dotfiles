function project-pull -a projname -d "Pull updated project files."
    if test -z "$projname"
        echo "ERROR: missing project name"
        return 1
    end
    # get project
    if not set -q PROJECTS_FILE
        echo "ERROR: project file environment variable not set"
        return 1
    end
    # parse project file and get project dir
    set projdir (get-project-path "$projname")
    if test "$status" != 0
        echo "ERROR: could not find project named $projname"
        return 1
    end
    # try to see if it is a git repository
    set isrepo (is-git-repo "$projdir")
    if test "$isrepo" = 0
        echo "ERROR: not a git repository"
        return 1
    end
    echo "INFO: pulling project $projname at $projdir"
    set realdir (echo $projdir | string replace "~" $HOME)
    # pull
    set ret (git -C $realdir pull 2> /dev/null)
    if test "$status" != 0
        # failed
        echo "ERROR: git failed with: $ret"
        return 1
    end
    # success
    return 0
end
