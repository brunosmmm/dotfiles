# set path
set -U fish_user_paths $fish_user_paths ~/.local/bin

# set theme options
set -g theme_nerd_fonts yes
set -g theme_display_git_master_branch yes

function fish_user_key_bindings
    bind \cr 'peco_select_history (commandline -b)'
    bind \cf 'fuck'
end

# emacs ansi-term support
if test -n "$EMACS"
    set -x TERM eterm-color
end

# this function may be required
function fish_title
    true
end

thefuck --alias | source

eval (python -m virtualfish auto_activation compat_aliases)
