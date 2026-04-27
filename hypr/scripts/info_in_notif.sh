#!/bin/bash

time=$(date +%H:%M:%S)
day=$(date +%A)
date=$(date +%d.%m)
bat_percentage=$(cat /sys/class/power_supply/BAT0/capacity)

notify-send \
	"info-in-notify" \
	"$time, $day $date • $bat_percentage%" \
	-t 5000
