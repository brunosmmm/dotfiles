function org-pull -a orgdir -d "Pull updated org files."
    if test -z "$orgdir"
        if not set -q ORGDIR
            echo "ORGDIR variable not set."
            return 1
        end
        set orgdir "$ORGDIR"
    end
    git -C "$orgdir" pull 2>&1 > /dev/null
    echo "done"
end
