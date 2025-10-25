{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "monospace:pixelsize=16";
        pad = "16x16";
      };
      colors = {
        foreground = "ffffff";
        background = "202020";
        alpha = 0.5;

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