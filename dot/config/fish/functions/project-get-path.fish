function project-get-path -a projname -d "Get project path."
    set ret (__bmorais_check_project $projname)
    set match (echo $ret | string match "^ERROR:.*" -r)
    echo $ret
    if not test -z "$match"
        return 1
    end
end
