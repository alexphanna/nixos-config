{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
    libresprite
    galculator
    resources # task manager
    proton-vpn
    mcomix
    discord

    google-chrome
  ];
}
