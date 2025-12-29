{ pkgs, ... }:
let
  stremio-linux-shell = pkgs.callPackage ./../../packages/stremio-linux-shell.nix { };
in
{
  home.packages = with pkgs; [
    spotify
    gimp
    galculator
    resources # task manager
    foliate
    protonvpn-gui
    stremio-linux-shell
  ];
}
