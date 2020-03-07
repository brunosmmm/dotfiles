function project-pull -a projname -d "Pull updated project files."
    set ret (__project_check_project $projname)
    set match (echo $ret | string match "^ERROR:.*" -r)
    if not test -z "$match"
        echo $ret
        return 1
    end

    echo "INFO: pulling project $projname at $ret"
    # pull
    set ret (git -C $ret pull 2> /dev/null)
    if test "$status" != 0
        # failed
        echo "ERROR: git failed with: $ret"
        return 1
    end
    # success
    return 0
end
