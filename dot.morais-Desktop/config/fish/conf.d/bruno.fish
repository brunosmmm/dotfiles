
set -x PROJECTS_FILE "$HOME/.config/projects/projects.json"
set -x CREDENTIALS_FILE "$HOME/.config/projects/credentials.json"
set -x BOOKMARKS_FILE "$HOME/.config/projects/bookmarks.json"
set -gx KEY_CONFIG_FILE "$HOME/.config/projects/keys.json"
set -gx GPG_PUB_KEY "FB43981B528DEE5384536A94A97D960C98AFEA94"
set -g theme_date_timezone America/New_York
set -g theme_nerd_fonts yes
set -U fish_user_paths /home/bruno/.local/bin $fish_user_paths

# configure display
set -gx GDK_SCALE 2
set -gx GDK_DPI_SCALE 0.5
set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1

# aliases
alias ls exa
