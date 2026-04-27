#!/bin/sh

BAT_PATH="/sys/class/power_supply/BAT0/capacity"
STATUS_PATH="/sys/class/power_supply/BAT0/status"

while true; do
    if [ -f "$BAT_PATH" ] && [ -f "$STATUS_PATH" ]; then
        PERCENTAGE=$(cat "$BAT_PATH")
        STATUS=$(cat "$STATUS_PATH")

        if [ "$STATUS" != "Charging" ]; then
            if [ "$PERCENTAGE" -lt 5 ]; then
                notify-send "battery warning" "Critical: $PERCENTAGE%" -u critical
            elif [ "$PERCENTAGE" -le 15 ]; then
                notify-send "battery warning" "Low: $PERCENTAGE%" -u normal
            fi
        fi
    fi

    sleep 60
done
