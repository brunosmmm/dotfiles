function bookmark-goto -a bookmarkname -d "Go to bookmark location."
    set ret (bookmark-get-path "$bookmarkname")
    if not test $status -eq 0
        echo $ret
        return 1
    end
    cd "$ret"
end
