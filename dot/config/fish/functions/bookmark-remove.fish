function bookmark-remove -a bookmarkname -d "Remove a bookmark"
    if test -z "$bookmarkname"
        echo "ERROR: missing bookmark name"
        return 1
    end
    if not set -q BOOKMARKS_FILE
        echo "ERROR: bookmark file environment variable not set"
        return 1
    end
    set ret (cat "$BOOKMARK_FILE" | jq ".\"$bookmarkname\"" -r)
    if test "$status" != 0
        echo "ERROR: internal error"
        return 1
    end
    if test "$ret" = "null"
        echo "ERROR: project $bookmarkname doesnt exist"
        return 1
    end

    # finally remove
    set contents (cat "$BOOKMARKS_FILE" | jq "del(.\"$bookmarkname\")" -r)
    echo "$contents" > "$BOOKMARKS_FILE"
end
