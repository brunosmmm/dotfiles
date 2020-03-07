function project-remove -a projname -d "Remove a project"
    if test -z "$projname"
        echo "ERROR: missing project name"
        return 1
    end
    if not set -q PROJECTS_FILE
        echo "ERROR: project file environment variable not set"
        return 1
    end
    set ret (cat "$PROJECTS_FILE" | jq ".\"$projname\"" -r)
    if test "$status" != 0
        echo "ERROR: internal error"
        return 1
    end
    if test "$ret" = "null"
        echo "ERROR: project $projname doesnt exist"
        return 1
    end

    # finally remove
    set contents (cat "$PROJECTS_FILE" | jq "del(.$projname)" -r)
    echo "$contents" > "$PROJECTS_FILE"
end
