function project-goto -a projname -d "Go to project location."
    set ret (project-get-path "$projname")
    if not test $status -eq 0
        echo $ret
        return 1
    end
    cd "$ret"
end
