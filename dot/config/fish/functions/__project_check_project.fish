function __project_check_project -a projname
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
    set projdir (__project_get_project_path "$projname")
    if test "$status" != 0
        echo "ERROR: could not find project named $projname"
        return 1
    end
    if not __project_is_git_repo "$projdir"
        echo "ERROR: not a git repository"
        return 1
    end
    set realdir (echo $projdir | string replace "~" $HOME)
    echo "$realdir"
end
