function project-list -d "Get project list"
    if not set -q PROJECTS_FILE
        echo "ERROR: PROJECTS_FILE environment variable not set"
        return 1
    end

    cat "$PROJECTS_FILE" | jq 'keys[]' -r
end
