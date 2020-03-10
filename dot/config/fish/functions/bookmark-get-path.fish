function bookmark-get-path -a bookmarkname -d "Get bookmark path."
    set ret (__bookmark_check $bookmarkname)
    set match (echo $ret | string match "^ERROR:.*" -r)
    echo $ret
    if not test -z "$match"
        return 1
    end
end
