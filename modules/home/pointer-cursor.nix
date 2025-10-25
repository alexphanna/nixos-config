{ pkgs, ... }:
{
  home.pointerCursor = {
    enable = true;
    package = pkgs.apple-cursor;
    name = "macOS";
    sway.enable = true;
    gtk.enable = true;
  };
}