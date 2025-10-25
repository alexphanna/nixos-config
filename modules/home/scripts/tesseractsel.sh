#!/usr/bin/env zsh

grim -g "$(slurp)" /tmp/screenshot.png
tesseract /tmp/screenshot.png /tmp/text -l eng
cat /tmp/text.txt | wl-copy
rm /tmp/screenshot.png /tmp/text.txt