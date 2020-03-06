function __bmorais_check_project -a projname
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
        return
    end
    # try to see if it is a git repository
    set isrepo (is-git-repo "$projdir")
    if test "$isrepo" = 0
        echo "ERROR: not a git repository"
        return
    end
    set realdir (echo $projdir | string replace "~" $HOME)
    echo "$realdir"
end
