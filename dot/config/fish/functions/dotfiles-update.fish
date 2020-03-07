function dotfiles-update -a opt -d "Update dotfiles from home directory."
    set dotfilepath (project-get-path dotfiles)
    $dotfilepath/scripts/dotupdate "$dotfilepath/dot" update --interactive
    set hostname (hostname)
    $dotfilepath/scripts/dotupdate "$dotfilepath/dot.$hostname" update --interactive
end
