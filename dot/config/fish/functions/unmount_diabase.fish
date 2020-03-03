function unmount_diabase -d "Unmount diabase home directory"
    set mountpoint (mount | awk '$1~"bmorais@diabase.ece.neu.edu.*"{print $3}')
    if test -z "$mountpoint"
        echo "not mounted"
        return
    end

    umount "$mountpoint"
end
