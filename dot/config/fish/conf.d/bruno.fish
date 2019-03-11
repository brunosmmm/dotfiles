
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

# function fish_user_key_bindings
#  bind \cr 'peco_select_history (commandline -b)'
# end
