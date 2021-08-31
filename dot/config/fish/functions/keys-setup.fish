function keys-setup -d "Setup keys for development"
    # TODO: verify that keychain is available
    # TODO: verify that GPG pub key variable is set
    if test -z $KEY_CONFIG_FILE
        echo "ERROR: missing key configuration file environment variable"
        return 1
    end
    if ! test -f $KEY_CONFIG_FILE
        echo "ERROR: key configuration file invalid or non existent"
        return 1
    end
    set keys (cat $KEY_CONFIG_FILE | jq -jr 'keys | .[]')
    for key in $keys
        set -a key_chksums (ssh-keygen -lf $key | awk '{print $2}')
    end
    keychain -q --eval --agents gpg $GPG_PUB_KEY > /dev/null
    eval (keychain -q --eval --agents ssh)
    set loaded_keys (keychain --list | awk '{print $2}')
    set keyidx 1
    for chksum in $key_chksums
        set already_loaded false
        for loaded in $loaded_keys
            if test (string trim $chksum) = (string trim $loaded)
                set already_loaded true
            end
        end
        if test $already_loaded = false
            set keyloc $keys[$keyidx]
            set passname (cat $KEY_CONFIG_FILE | jq -jr ".\"$keyloc\"")
            $HOME/.local/bin/add-ssh-key $keyloc $passname > /dev/null
        end
        set keyidx (math $keyidx + 1)
    end
end
