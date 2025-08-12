{ pkgs, username, ... }:
{
  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    hardware.openrgb.enable = true;
    udisks2.enable = true;
    devmon.enable = true;
    fstrim.enable = true;
    openssh.enable = true;
    openssh.settings.GatewayPorts = "yes";
    getty.autologinUser = "${username}";
  };
}