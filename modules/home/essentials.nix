{ pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    gimp
    libresprite
    galculator
    resources # task manager
    protonvpn-gui
    unstable.stremio-linux-shell
  ];
}
