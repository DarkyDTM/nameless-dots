#!/bin/bash

last_video=$(eza --sort newest ~/Videos/Records/ | tail -n 1)
last_video_path=~/Videos/Records/$last_video

ripdrag $last_video_path --all-compact --and-exit
