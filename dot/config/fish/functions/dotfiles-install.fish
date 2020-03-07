function dotfiles-install -d "Install dotfiles"
    set dotfilepath (project-get-path dotfiles)
    $dotfilepath/scripts/dotupdate "$dotfilepath/dot" install --interactive
    $dotfilepath/scripts/dotupdate "$dotfilepath/dot.$hostname" install --interactive
end
