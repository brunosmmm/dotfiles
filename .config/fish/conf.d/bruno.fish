fundle plugin 'tuvistavie/fish-ssh-agent'

set -g theme_nerd_fonts yes
set -g theme_display_tasks yes

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
set -x PATH "/home/bruno/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

eval (python -m virtualfish auto_activation compat_aliases)
