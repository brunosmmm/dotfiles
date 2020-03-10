function bookmark-list -d "Get bookmark list"
    if not set -q BOOKMARKS_FILE
        echo "ERROR: BOOKMARKS_FILE environment variable not set"
        return 1
    end

    cat "$BOOKMARKS_FILE" | jq 'keys[]' -r
end
