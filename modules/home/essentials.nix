{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
    libresprite
    galculator
    unstable.tux-manager # task manager
    proton-vpn
    mcomix
    discord

    google-chrome
  ];
}
