function bookmark-get-path -a bookmarkname -d "Get bookmark path."
    set ret (__bookmark_check $bookmarkname)
    if string match -rq -- '^ERROR:' $ret
        echo $ret >&2
        return 1
    end
    echo $ret
end
