function credentials-get -a what -d "Get credentials for a key"
    if test -z "$what"
        return -1
    end

    if not set -q CREDENTIALS_FILE
        return -1
    end

    if not test -f "$CREDENTIALS_FILE"
        return -1
    end

    set user (cat "$CREDENTIALS_FILE" | jq ."$what".user -r)
    set pass (cat "$CREDENTIALS_FILE" | jq ."$what".pass -r)
    set pass_type (cat "$CREDENTIALS_FILE" | jq ."$what".pass_type -r)
    if test "$pass_type" = "null"
        return -1
    end
    if test "$user" = "null"
        return -1
    end
    if test "$pass" = "null"
        return -1
    end

    if test "$pass_type" = "text"
        echo "$user:$pass"
    else
        if test "$pass_type" = "pass"
            set pass (pass "$pass")
            echo "$user:$pass"
        end
    end
end
