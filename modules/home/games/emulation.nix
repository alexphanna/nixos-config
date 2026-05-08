{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cemu
    pcsx2
    unstable.rpcs3
    dolphin-emu
  ];
}