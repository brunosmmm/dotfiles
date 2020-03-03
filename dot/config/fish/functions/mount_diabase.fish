
function mount_diabase -a where -d "Mount diabase filesystem using sshfs"
    set DEFAULT_DIABASE_MOUNTPOINT "/home/bruno/work/esl/diabase"
    if not test -z "$where"
        set mountpoint "$where"
    else
        set mountpoint "$DEFAULT_DIABASE_MOUNTPOINT"
    end

    if not test -e "$mountpoint"
        mkdir -p "$mountpoint"
    end
    # mount
    mount -t sshfs bmorais@diabase.ece.neu.edu: "$mountpoint"

    echo "mounted at $mountpoint"
end
