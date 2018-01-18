
# taskwarrior related stuff
function bm_taskwarrior
end

function bm_taskwarrior_pending --description="Number of pending taskwarrior tasks"
  if type -q task
    task export | jq 'map(select(.status != "completed" and .status != "deleted")) | length'
  else
    echo "?"
  end
end

function bm_taskwarrior_pastdue --description="Number of past due taskwarrior tasks"
  if type -q task
    task export due.before:now | jq 'map(select(.status != "completed" and .status != "deleted")) | length'
  else
    echo "?"
  end
end
