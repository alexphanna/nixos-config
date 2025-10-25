#!/usr/bin/env zsh

mkdir -p ~/Pictures/Screenshots 
date=$(date +%m-%d-%Y-%H%M%S)
grim -g "$(slurp)" ~/Pictures/Screenshots/$date.png
cat ~/Pictures/Screenshots/$date.png | wl-copy -t image/png