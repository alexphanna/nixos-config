{ pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    gimp
    libresprite
    galculator
    resources # task manager
    protonvpn-gui
    jellyfin-desktop
  ];
}
