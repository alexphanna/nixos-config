{pkgs, ...}: 
{
  hardware.openrgb.enable = true;
  home.packages = with pkgs; [
    openrgb-with-all-plugins
  ];
}