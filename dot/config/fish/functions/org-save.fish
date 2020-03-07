function org-save -d "Push updated org files."
    project-auto-commit org
    project-push org

    # get credentials

    # push to webdav
    set orgpath (project-get-path org)
    set orgfiles (git -C "$orgpath" ls-files)
    set credentials (credentials-get webdav)
    for orgfile in $orgfiles
        # upload directly
        # curl --user "$credentials" -T "$orgpath/$orgfile" 'https://bmorais39.duckdns.org:88/webdav/' --anyauth
    end
end
