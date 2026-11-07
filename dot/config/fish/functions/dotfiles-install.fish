function dotfiles-install -d "Install dotfiles"
    set dotfilepath (project-get-path dotfiles)
    if test $status -ne 0
        return 1
    end
    set -l opts $argv
    if test (count $opts) -eq 0
        set opts --interactive
    end
    $dotfilepath/scripts/dotupdate "$dotfilepath/dot" install $opts
    set -l host_overlay "$dotfilepath/dot.$hostname"
    if test -d "$host_overlay" -a -e "$host_overlay/.dotfiles"
        $dotfilepath/scripts/dotupdate $host_overlay install $opts
    else
        echo "WARNING: no host overlay at $host_overlay, skipped"
    end
end
