{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dmg2img
  ];
}