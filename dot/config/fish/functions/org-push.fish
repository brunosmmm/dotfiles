function org-push -a orgdir commitmsg -d "Push updated org files."
    if test -z "$orgdir"
        if not set -q ORGDIR
            echo "ORGDIR variable not set."
            return 1
        end
        set orgdir "$ORGDIR"
    end
    if test -z "$commitmsg"
        set commitmsg "Update org files"
    end
    if not test -d "$orgdir"
        echo "ERROR: directory does not exist"
        return 1
    end
    set changes (git -C "$orgdir" status --porcelain=v1 | awk 'BEGIN{modified=0;} $1=="M"{modified+=1;} END{print modified;}')
    if test "$changes" != "0"
        git -C "$orgdir" commit -am "$commitmsg" 2>&1 > /dev/null && git push
        echo "done"
    else
        echo "no changes detected"
    end
end
