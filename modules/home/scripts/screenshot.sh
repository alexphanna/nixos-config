#!/usr/bin/env zsh

mkdir -p ~/Pictures/Screenshots
date=$(date +%m-%d-%Y-%H%M%S)
grim -g "0,0 1920x1080" ~/Pictures/Screenshots/$date.png
cat ~/Pictures/Screenshots/$date.png | wl-copy -t image/png