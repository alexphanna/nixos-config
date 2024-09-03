#!/bin/sh

scrot /tmp/screenshot.png -s
tesseract /tmp/screenshot.png /tmp/text -l eng
xclip -sel c /tmp/text.txt
rm /tmp/screenshot.png /tmp/text.txt