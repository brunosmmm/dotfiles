function diabase_tunnel -a cmd -d "Enable ssh tunnel to diabase"
    switch "$cmd"
        case enable
            if test -e /tmp/diabase-sock
                echo "tunnel is already up, error"
                return 1
            end
            ssh -q -N -f -S /tmp/diabase-sock -L 9999:10.75.15.172:22 bmorais@gateway.coe.neu.edu
        case disable
            if not test -e /tmp/diabase-sock
                echo "tunnel is not up, error"
                return 1
            end
            ssh -q -S /tmp/diabase-sock -O exit bmorais@localhost 2>&1 1> /dev/null
        case status
            if test -e /tmp/diabase-sock
                echo "tunnel is up"
            else
                echo "tunnel is not up"
            end
        case \*
            echo "invalid command; available: enable, disable, status"
    end
end
