function dotfiles-install -d "Install dotfiles"
    set dotfilepath (project-get-path dotfiles)
    $dotfilepath/scripts/dotupdate "$dotfilepath/dot" install --interactive
    set hostname (hostname)
    $dotfilepath/scripts/dotupdate "$dotfilepath/dot.$hostname" install --interactive
end
