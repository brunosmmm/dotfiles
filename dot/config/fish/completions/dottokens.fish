function __dottokens_pass_entries
    set -l store $PASSWORD_STORE_DIR
    if test -z "$store"
        set store $HOME/.password-store
    end
    if not test -d $store
        return
    end
    find $store -name '*.gpg' -printf '%P\n' 2>/dev/null | string replace -r '\.gpg$' ''
end

complete -c dottokens -f
complete -c dottokens -s f -l file -r -d "Mapping file"
complete -c dottokens -n '__fish_use_subcommand' -a list -d "List bindings"
complete -c dottokens -n '__fish_use_subcommand' -a add -d "Bind a variable to a pass entry"
complete -c dottokens -n '__fish_use_subcommand' -a remove -d "Unbind a variable"
complete -c dottokens -n '__fish_use_subcommand' -a rm -d "Unbind a variable"
complete -c dottokens -n '__fish_use_subcommand' -a check -d "Verify pass entries exist"

complete -c dottokens -n '__fish_seen_subcommand_from list' -l json -d "JSON output"
complete -c dottokens -n '__fish_seen_subcommand_from list' -l names -d "Variable names only"
complete -c dottokens -n '__fish_seen_subcommand_from check' -l json -d "JSON output"

complete -c dottokens -n '__fish_seen_subcommand_from add' -l insert -d "Create missing pass entry"
complete -c dottokens -n '__fish_seen_subcommand_from add' -l force -d "Replace existing binding"
complete -c dottokens -n '__fish_seen_subcommand_from add' -a '(__dottokens_pass_entries)'

complete -c dottokens -n '__fish_seen_subcommand_from remove rm' -l from-pass -d "Also delete the pass entry"
complete -c dottokens -n '__fish_seen_subcommand_from remove rm' -s y -l yes -d "Do not confirm"
complete -c dottokens -n '__fish_seen_subcommand_from remove rm' -a '(dottokens list --names 2>/dev/null)'
