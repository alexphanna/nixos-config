{ pkgs, pkgs-unstable, config, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ]
  ++ [ (import ./virtualization.nix) ];

  services = {
    xserver.videoDrivers = ["nvidia"];
    jellyfin.enable = true;
  };

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg

    unstable.blockbench
  ];

  boot.kernelPackages = pkgs.unstable.linuxPackages;

  hardware.nvidia = {
    package = pkgs.unstable.linuxPackages.nvidiaPackages.production;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };
}