function keys-setup -d "Setup keys for development"
    if not command -q keychain
        echo "ERROR: keychain is not available"
        return 1
    end
    if test -z "$GPG_PUB_KEY"
        echo "ERROR: GPG_PUB_KEY is not set"
        return 1
    end
    if test -z $KEY_CONFIG_FILE
        echo "ERROR: missing key configuration file environment variable"
        return 1
    end
    if ! test -f $KEY_CONFIG_FILE
        echo "ERROR: key configuration file invalid or non existent"
        return 1
    end
    set keys (cat $KEY_CONFIG_FILE | jq -r 'keys[]')
    for key in $keys
        set -a key_chksums (ssh-keygen -lf $key | awk '{print $2}')
    end
    keychain -q --eval $GPG_PUB_KEY | source
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
            set passname (cat $KEY_CONFIG_FILE | jq -r ".\"$keyloc\"")
            $HOME/.local/bin/add-ssh-key $keyloc $passname > /dev/null
        end
        set keyidx (math $keyidx + 1)
    end

    # Load API tokens from pass
    set -l api_tokens_file (dirname $KEY_CONFIG_FILE)/api-tokens.json
    if test -f $api_tokens_file
        set -l token_vars (cat $api_tokens_file | jq -r 'keys[]')
        for var in $token_vars
            set -l passentry (cat $api_tokens_file | jq -r ".\"$var\"")
            set -l token (pass show $passentry 2>/dev/null)
            if test $status -eq 0
                set -gx $var $token
            else
                echo "WARNING: failed to retrieve token for $var from pass entry '$passentry'"
            end
        end
    end
end
