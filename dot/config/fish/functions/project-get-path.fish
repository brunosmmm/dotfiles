function project-get-path -a projname -d "Get project path."
    set ret (__project_check_project $projname)
    if string match -rq -- '^ERROR:' $ret
        echo $ret >&2
        return 1
    end
    echo $ret
end
