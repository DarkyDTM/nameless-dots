#!/bin/bash

case "$1" in
mute)
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	;;
reset)
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%	
	;;
raise)
	if [[ -z "$2" ]]; then
		echo "Usage: $0 raise STEP"
		exit 1
	fi
	wpctl set-volume @DEFAULT_AUDIO_SINK@ $2%+
	;;
lower)
	if [[ -z "$2" ]]; then
		echo "Usage: $0 lower STEP"
		exit 1
	fi
	wpctl set-volume @DEFAULT_AUDIO_SINK@ $2%-
	;;
*)
	echo "Usage: $0 {reset/mute/raise STEP/lower STEP}"
	exit 1
	;;
esac
