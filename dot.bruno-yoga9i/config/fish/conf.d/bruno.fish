
# configure theme more
set -g theme_nerd_fonts yes
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# set default project file
set -x PROJECTS_FILE "$HOME/.config/projects/projects.json"
set -x CREDENTIALS_FILE "$HOME/.config/projects/credentials.json"
set -x BOOKMARKS_FILE "$HOME/.config/bookmarks/bookmarks.json"
set -gx GPG_PUB_KEY "07E511D48BDEDC60467A65CBB52BA6CC0596000E"
set -gx KEY_CONFIG_FILE "$HOME/.config/projects/keys.json"

# paths
# set -x GOPATH /home/bruno/.go
set -gx PATH /home/bruno/.local/bin $PATH

# editor
set -x EDITOR (which vim)

# aliases
alias ls exa
# alias cat bat
# alias ssh "env TERM=xterm-256color ssh"

set -U FZF_LEGACY_KEYBINDINGS 0
