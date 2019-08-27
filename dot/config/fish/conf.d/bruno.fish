
# configure theme more
set -g theme_nerd_fonts yes
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# virtualfish
eval (python -m virtualfish auto_activation projects)

# paths
set -x GOPATH /home/bruno/.go
set -gx PATH /home/bruno/.local/bin:/home/bruno/.gem/ruby/2.6.0/bin:/home/bruno/.yarn/bin $PATH

# editor
set -x EDITOR (which vim)

# aliases
alias ls exa
alias cat bat
alias ssh "env TERM=xterm-256color ssh"

set -U FZF_LEGACY_KEYBINDINGS 0
