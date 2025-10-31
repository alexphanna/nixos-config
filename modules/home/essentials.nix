{ pkgs, ... }:
let
  stremio-enhanced = pkgs.callPackage ./../../packages/stremio-enhanced.nix { };
in
{
  home.packages = with pkgs; [
    spotify
    gimp
    obsidian
    stremio-enhanced
    galculator
    foliate # for reading books
    resources # task manager
    protonvpn-gui
    gucharmap
    inkscape
  ];
}
