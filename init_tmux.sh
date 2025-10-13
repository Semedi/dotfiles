#!/bin/bash
# tmux_sessions_bootstrap.sh
# Minimal tmux sessions bootstrap with dir validation

# Embedded session-window-directory map (edit as needed)
read -r -d '' SESSIONS_JSON <<'EOF'
{
  "Personal": {
    "home": "/home/semedi",
    "mini-transformer": "/home/semedi/Workspace/personal/mini_transformer",
    "dot-files": "/home/semedi/dotfiles"
  },
  "PRV": {
    "infraestructure": "/home/semedi/Workspace/Dormakaba/porthos-prv-terraform-aws",
    "Backend": "/home/semedi/Workspace/Dormakaba/porthos-prv-nodejs-lambdas"
  },
  "NES": {
    "infraestructure": "/home/semedi/Workspace/Dormakaba/porthos-notifications-events-service/infrastructure",
    "Backend": "/home/semedi/Workspace/Dormakaba/porthos-notifications-events-service/src",
    "Deployment": "/home/semedi/Workspace/Dormakaba/porthos-notifications-deployment",
    "Testing": "/home/semedi/Workspace/Dormakaba/porthos-notifications-qa-ts-api-framework"
  },
  "DOC": {
    "porthos": "/home/semedi/Workspace/Dormakaba/porthos-common-docs"
  }
}
EOF

# Default directory fallback
DEFAULT_DIR="${HOME}"

validate_dir() {
  local dir="$1"
  if [[ -d "$dir" ]]; then echo "$dir"; else echo "$DEFAULT_DIR"; fi
}

jq -r 'to_entries[] | "\(.key) \(.value | to_entries[] | "\(.key) \(.value)")"' <<<"$SESSIONS_JSON" |\
while read -r session window dir; do
  dir="$(validate_dir "$dir")"
  if ! tmux has-session -t "$session" 2>/dev/null; then
    tmux new-session -d -s "$session" -n "$window" -c "$dir"
    tmux split-window -v -p 20 -c "$dir" -t "$session:$window"
  else
    tmux new-window -t "${session}:" -n "$window" -c "$dir"
    tmux split-window -v -p 20 -c "$dir" -t "$session:$window"
  fi
done

# Attach to first session (or PRV)
tmux attach-session -t "PRV" || tmux attach
