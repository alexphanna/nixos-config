#!/bin/sh

mkdir -p ~/Pictures/Screenshots
scrot ~/Pictures/Screenshots/%m-%d-%Y-%H%M%S.png -e 'xclip -selection clipboard -target image/png -i $f'