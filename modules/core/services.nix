{ pkgs, ... }:
{
  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    hardware.openrgb.enable = true;
    udisks2.enable = true;
    devmon.enable = true;
    invidious = {
      enable = true;
      sig-helper.enable = true;
      domain = "192.168.0.36";
      port = 3000;
    };
  };
}