function project-add -a projname projpath -d "add a project"
    if test -z "$projname"
        echo "error: missing project name"
        return 1
    end
    if test -z "$projpath"
        echo "error: missing project path"
        return 1
    end
    if not set -q PROJECTS_FILE
        echo "error: project file environment variable not set"
        return 1
    end
    set ret (cat "$PROJECTS_FILE" | jq ".$projname" -r)
    if test "$status" != 0
        echo "error: internal error"
        return 1
    end
    if test "$ret" != "null"
        echo "error: project $projname already exists"
        return 1
    end
    if not test -d "$projpath"
        echo "error: invalid project path"
        return 1
    end
    __project_is_git_repo "$projpath"
    if test "$status" = 0
        echo "error: project path is not a git repository"
        return 1
    end
    set abspath (realpath "$projpath")
    # finally add
    set contents (cat "$PROJECTS_FILE" | jq ". |= . +{\"$projname\": \"$abspath\"}" -r)
    echo "$contents" > "$PROJECTS_FILE"
end
