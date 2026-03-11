#!/bin/bash

PID="$(hyprctl -j activewindow | jq .pid)"

STAT_FILE="/proc/$PID/stat"

if [ ! -f "$STAT_FILE" ]; then
  exit 1
fi

PROCESS_STATE=$(awk '{print $3}' "$STAT_FILE" 2>/dev/null)

if [ -z "$PROCESS_STATE" ]; then
  exit 1
fi

if [[ "$PROCESS_STATE" == "T" || "$PROCESS_STATE" == "t" ]]; then
  if kill -SIGCONT "$PID"; then
    NEW_STATE=$(awk '{print $3}' "$STAT_FILE" 2>/dev/null)
  else
    exit 1
  fi
else
  if kill -SIGSTOP "$PID"; then
    sleep 0.1
    NEW_STATE=$(awk '{print $3}' "$STAT_FILE" 2>/dev/null)
  else
    exit 1
  fi
fi

exit 0
