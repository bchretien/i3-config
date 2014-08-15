#!/bin/sh

# If tmux is not available or the terminal is unknown, simply return
# the terminal
if [[ -z `command -v tmux` || -z "$TERMINAL" ]]; then
  i3-sensible-terminal
else
  # Command: reattach tmux session if any, else create a new one
  COMMAND="tmux -q has-session && exec tmux attach-session -d
           || exec tmux new-session -n$USER -s$USER@$HOSTNAME"

  if [[ "$TERMINAL" = "urxvt" ]]; then
    urxvt -e $SHELL -c $COMMAND
  elif [[ "$TERMINAL" = "termite" ]]; then
    termite -e "$SHELL -c $COMMAND"
  else
     i3-sensible-terminal
  fi
fi

