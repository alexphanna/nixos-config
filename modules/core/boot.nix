{ pkgs, config, ... }:
{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelParams = [ "quiet" ];
    supportedFilesystems = [ "ntfs" ];
  };
  security.polkit.enable = true;
}