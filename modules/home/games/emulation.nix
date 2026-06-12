{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cemu
    pcsx2
    dolphin-emu
  ];
}
