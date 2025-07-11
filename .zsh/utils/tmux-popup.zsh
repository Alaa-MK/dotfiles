session="_popup_$(tmux display -p '#S')"

if ! tmux has -t "$session" 2> /dev/null; then
  session_id="$(tmux new-session -dP -s "$session" -F '#{session_id}')"
  tmux set-option -s -t "$session_id" key-table popup
  tmux set-option -s -t "$session_id" status off
  tmux set-option -s -t "$session_id" prefix None
  tmux set-option -s -t "$session_id" pane-border-status off
  session="$session_id"
fi

exec tmux attach -t "$session" > /dev/null
