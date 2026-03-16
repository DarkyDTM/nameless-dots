#!/usr/bin/env bash
# record.sh — screen recorder wrapper for gpu-screen-recorder
# Usage: record.sh [--sound | --fullscreen | --fullscreen-sound]

set -euo pipefail

# ─── Constants ────────────────────────────────────────────────────────────────
readonly APP_NAME="Recorder"
readonly FPS=60
readonly CONTAINER="mp4"
readonly CODEC="av1"          # modern, efficient codec; fallback handled below
readonly QUALITY="very_high"  # quality preset: low/medium/high/very_high

# ─── Helpers ──────────────────────────────────────────────────────────────────
getdate()        { date '+%Y-%m-%d_%H.%M.%S'; }
notify()         { notify-send "$1" "$2" -a "$APP_NAME"; }
get_monitor()    { hyprctl monitors -j | jq -r '.[] | select(.focused) | .name'; }

get_audio_sink() {
  local sink
  sink="$(pactl get-default-sink).monitor"
  if [[ "$sink" == ".monitor" ]]; then
    notify "Recording error" "Audio sink not found"
    exit 1
  fi
  echo "$sink"
}

get_region() {
  local raw
  raw="$(slurp 2>/dev/null)" || true
  if [[ -z "$raw" ]]; then
    notify "Recording cancelled" "Selection was cancelled"
    exit 1
  fi
  # slurp outputs "x,y widthxheight" → GSR expects "WxH+X+Y"
  sed -E 's/([0-9]+),([0-9]+) ([0-9]+)x([0-9]+)/\3x\4+\1+\2/' <<< "$raw"
}

# ─── Output directory ─────────────────────────────────────────────────────────
xdg_video="$(xdg-user-dir VIDEOS)"
[[ "$xdg_video" == "$HOME" ]] && xdg_video=""
records_dir="${xdg_video:-$HOME/Videos}/Records"
mkdir -p "$records_dir"
cd "$records_dir"

# ─── Stop if already recording ────────────────────────────────────────────────
if pgrep -f gpu-screen-recorder &>/dev/null; then
  notify "Stopping recording" "Saving file…"
  pkill -SIGINT -f gpu-screen-recorder
  exit 0
fi

# ─── Common recorder flags ────────────────────────────────────────────────────
filename="recording_$(getdate).$CONTAINER"
notify "Starting recording" "$filename"

base_flags=(
  -f "$FPS"
  -c "$CONTAINER"
  -k "$CODEC"
  -q "$QUALITY"
  -restore-portal-session yes
  -cursor yes
  -fallback-cpu-encoding yes
  -o "$filename"
)

# ─── Mode selection ───────────────────────────────────────────────────────────
case "${1:-}" in

  --sound)
    region="$(get_region)"
    gpu-screen-recorder \
      -w region \
      -region "$region" \
      -a "$(get_audio_sink)" \
      "${base_flags[@]}" &
    ;;

  --fullscreen-sound)
    gpu-screen-recorder \
      -w "$(get_monitor)" \
      -a "$(get_audio_sink)" \
      "${base_flags[@]}" &
    ;;

  --fullscreen)
    gpu-screen-recorder \
      -w "$(get_monitor)" \
      "${base_flags[@]}" &
    ;;

  "")
    region="$(get_region)"
    gpu-screen-recorder \
      -w region \
      -region "$region" \
      "${base_flags[@]}" &
    ;;

  *)
    echo "Unknown option: $1" >&2
    echo "Usage: $0 [--sound | --fullscreen | --fullscreen-sound]" >&2
    exit 1
    ;;

esac

disown
