{ lib, backgroundColor, foregroundColor, ... }:
let
  # map a hex char → its numeric value
  hexMap = {
    "0"=0; "1"=1; "2"=2; "3"=3; "4"=4; "5"=5; "6"=6; "7"=7; "8"=8; "9"=9;
    "a"=10; "b"=11; "c"=12; "d"=13; "e"=14; "f"=15;
    "A"=10; "B"=11; "C"=12; "D"=13; "E"=14; "F"=15;
  };

  hexPairToInt = s:
    hexMap.${builtins.substring 0 1 s} * 16
    + hexMap.${builtins.substring 1 1 s};

  # drop '#'
  noHashtag = lib.strings.removePrefix "#" backgroundColor;

  # first 6 chars are RGB (as string)
  background = builtins.substring 0 6 noHashtag;

  # last 2 chars are alpha (hex → number → 0..1)
  aHex = builtins.substring 6 2 noHashtag;
  alpha = (hexPairToInt aHex) / 255.0;

  # optional: round to 2 decimals (e.g., 0.75)
  round2 = x: (builtins.floor (x * 100 + 0.5)) / 100.0;

  alphaRounded = round2 alpha;
in
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "monospace:pixelsize=16";
        pad = "16x16";
      };
      colors = {
        foreground = lib.strings.removePrefix "#" foregroundColor;
        background = background;
        alpha = alphaRounded;

        regular0 = "202020"; # black
        regular1 = "FF0000"; # red
        regular2 = "00FF00"; # green
        regular3 = "FF8000"; # yellow (orange)
        regular4 = "0080FF"; # blue
        regular5 = "8000FF"; # magenta (purple)
        regular6 = "00FFFF"; # cyan
        regular7 = "FFFFFF"; # white

        bright0 = "202020"; # black
        bright1 = "FF4040"; # red
        bright2 = "40FF40"; # green
        bright3 = "FFA040"; # yellow (orange)
        bright4 = "40A0FF"; # blue
        bright5 = "A040FF"; # magenta (purple)
        bright6 = "40FFFF"; # cyan
        bright7 = "FFFFFF"; # white
      };
      scrollback = {
        indicator-position = "none";
      };
    };
  };
}