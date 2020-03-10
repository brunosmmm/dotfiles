function bookmark-add -a bookmarkname bookmarkpath -d "add bookmark"
    if test -z "$bookmarkname"
        echo "ERROR: missing bookmark name"
        return 1
    end
    if test -z "$bookmarkpath"
        echo "ERROR: missing path"
        return 1
    end
    if not set -q BOOKMARKS_FILE
        echo "ERROR: bookmark file environment variable not set"
        return 1
    end
    set ret (cat "$BOOKMARKS_FILE" | jq ".\"$bookmarkname\"" -r)
    if test "$status" != 0
        echo "ERROR: internal error"
        return 1
    end
    if test "$ret" != "null"
        echo "ERROR: bookmark $bookmarkname already exists"
        return 1
    end
    if not test -d "$bookmarkpath"
        echo "error: invalid project path"
        return 1
    end
    set abspath (realpath "$bookmarkpath")
    # finally add
    set contents (cat "$BOOKMARKS_FILE" | jq ". |= . +{\"$bookmarkname\": \"$abspath\"}" -r)
    echo "$contents" > "$BOOKMARKS_FILE"
end
