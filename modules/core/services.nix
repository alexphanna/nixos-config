{ pkgs, ... }:
{
  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    hardware.openrgb.enable = true;
    ollama = {
      enable = true;
      acceleration = "cuda";
    };
    udisks2.enable = true;
    devmon.enable = true;
  };
}