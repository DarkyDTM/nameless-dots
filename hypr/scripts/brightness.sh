#!/bin/sh

brightness=$(brightnessctl get)

case "$1" in
	+)
		if [ "$brightness" -ge 1 ]; then
			doas brightnessctl set 5%+
		else
			doas brightnessctl set 1
		fi
		;;
	-)
		if [ "$brightness" -gt 4800 ] && [ "$brightness" -ne 1 ]; then
			doas brightnessctl set 5%-
		elif [ "$brightness" -le 1 ]; then
			doas brightnessctl set 0
		else
			doas brightnessctl set 1
		fi
		;;
	*)
		echo "Unknown argument"
		;;
esac
