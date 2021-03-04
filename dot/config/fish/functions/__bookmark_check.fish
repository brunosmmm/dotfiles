function __bookmark_check -a bookmarkname
  if not set -q BOOKMARKS_FILE
      echo "ERROR: bookmark file environment variable not set"
      return 1
  end
  set ret (cat "$BOOKMARKS_FILE" | jq ".\"$bookmarkname\"" -r)
  if test "$status" != 0
      echo "ERROR: internal error"
      return 1
  end
  echo "$ret"
end
