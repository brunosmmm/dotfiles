function neu-vpn-disconnect -d "Disconnect from NEU VPN"
    if not test -f ~/.local/var/vpn.pid
        return -1
    end
    set vpn_pid (cat ~/.local/var/vpn.pid)
    if sudo kill "$vpn_pid"
        sudo rm ~/.local/var/vpn.pid
    else
        return -1
    end

end
