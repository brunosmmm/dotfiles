function dotfiles-update -a opt -d "Update dotfiles from home directory."
    set dotfilepath (project-get-path dotfiles)
    $dotfilepath/scripts/dotupdate "$dotfilepath/dot" update --interactive
    project-push dotfiles
end
