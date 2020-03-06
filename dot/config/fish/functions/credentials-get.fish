function credentials-get -a what -d "Get credentials for a key"
    if test -z "$what"
        return
    end

    if not set -q CREDENTIALS_FILE
        return
    end

    if not test -f "$CREDENTIALS_FILE"
        return
    end

    set user (cat "$CREDENTIALS_FILE" | jq ."$what".user -r)
    set pass (cat "$CREDENTIALS_FILE" | jq ."$what".pass -r)
    if test "$user" = "null"
        return
    end
    if test "$pass" = "null"
        return
    end
    echo "$user:$pass"
end
