{
  lib,
  pkgs,
  accentColor,
  ...
}:
{
  home.packages = [
    (pkgs.writeScriptBin "screenshot" ''
      #!/usr/bin/env zsh

      choice=$(printf "Fullscreen\nSelection\nWindow\nOCR\nClip" | wmenu -n FFFFFF -N 000000 -s ${lib.strings.removePrefix "#" accentColor} -S 000000 -m FFFFFF -M 000000 -f "monospace 18")

      if [ "$choice" = "OCR" ]; then
        grim -g "$(slurp)" /tmp/screenshot.png
        tesseract /tmp/screenshot.png /tmp/text -l eng
        cat /tmp/text.txt | wl-copy
        rm /tmp/screenshot.png /tmp/text.txt
      elif [ "$choice" = "Clip" ]; then
        obs-cmd replay save
      else
        mkdir -p ~/Pictures/Screenshots 
        date=$(date +%m-%d-%Y-%H%M%S)

        if [ "$choice" = "Fullscreen" ]; then
            grim -g "0,0 1920x1080" ~/Pictures/Screenshots/$date.png
        elif [ "$choice" = "Selection" ]; then
            grim -g "$(slurp)" ~/Pictures/Screenshots/$date.png
        elif [ "$choice" = "Window" ]; then
            swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | grim -g - ~/Pictures/Screenshots/$date.png
        fi

        cat ~/Pictures/Screenshots/$date.png | wl-copy -t image/png
      fi
    '')

    # dependencies
    pkgs.tesseract
    pkgs.slurp
    pkgs.grim
    pkgs.wl-clipboard
    pkgs.jq
    pkgs.obs-cmd
  ];
}
