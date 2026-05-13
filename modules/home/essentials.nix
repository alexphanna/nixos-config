{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
    libresprite
    galculator
    resources # task manager
    protonvpn-gui
    jellyfin-desktop
    moonlight-qt
  ];
}
