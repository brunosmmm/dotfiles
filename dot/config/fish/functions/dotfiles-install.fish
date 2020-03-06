function dotfiles-install -d "Install dotfiles"
    set dotfilepath (project-get-path dotfiles)
    $dotfilepath/scripts/dotupdate "$dotfilepath/dot" install --interactive
end
