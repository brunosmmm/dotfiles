function project-auto-commit -a projname commitmsg -d "Automatically commit changes in project"
    set ret (__bmorais_check_project $projname)
    set match (echo $ret | string match "^ERROR:.*" -r)
    if not test -z "$match"
        echo $ret
        return 1
    end
    if test -z "$commitmsg"
        set commitmsg "Update $projname"
    end
    echo "INFO: auto-commiting changes in project $projname at $ret"
    set changes (git -C $ret status --porcelain=v1 | awk 'BEGIN{modified=0;} $1=="M"{modified+=1;} END{print modified;}')
    if test "$changes" != "0"
        git -C $ret commit -am "$commitmsg" 2>&1 > /dev/null
        echo "done"
    else
        echo "no changes detected"
    end
end
