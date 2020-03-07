function __project_get_project_path -a projname -d "Get project path."
    if not set -q PROJECTS_FILE
        return 1
    end

    if test -z "$projname"
        return 1
    end
    set projpath (cat "$PROJECTS_FILE" | jq ".$projname" -r)
    if test "$status" != 0
        #error
        return 1
    end

    if test "$projpath" = "null"
        # project not located
        return 1
    end
    #print path
    echo "$projpath"
    return 0
end
