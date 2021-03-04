function neu-vpn-connect -d "Connecto to NEU VPN"
    set --local vpn_pidfile ~/.local/var/vpn.pid
    if test -f ~/.local/var/vpn.pid
        # already running?
        set --local vpn_pid (cat ~/.local/var/vpn.pid)
        if sudo kill -0 "$vpn_pid"
            # is running
            echo "ERROR: VPN already connected"
            return -1
        else
            # file is leftover
            echo "WARNING: removing VPN pidfile"
            rm ~/.local/var/vpn.pid
        end
    end
    set --local credentials (credentials-get "neu")
    set --local _credentials (string split --max 1 ':' "$credentials")
    echo "$_credentials[2]" | sudo openconnect -q -b --pid-file="$vpn_pidfile" --protocol=gp --non-inter --user="$_credentials[1]" --passwd-on-stdin vpn.northeastern.edu
end
