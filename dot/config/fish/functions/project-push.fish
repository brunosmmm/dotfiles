function project-push -a projname -d "Push updated project files."
    set ret (__project_check_project $projname)
    set match (echo $ret | string match "^ERROR:.*" -r)
    if not test -z "$match"
        echo $ret
        return 1
    end
    # push
    echo "INFO: pushing project $projname from $ret"
    # pull
    set ret (git -C $ret push 2> /dev/null)
    if test "$status" != 0
        # failed
        echo "ERROR: git failed with: $ret"
        return 1
    end
    # success
    return 0
end
