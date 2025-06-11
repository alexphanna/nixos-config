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
    audiobookshelf = {
      enable = true;
      host = "0.0.0.0";
    };
    freshrss = {
      enable = true;
      passwordFile = "/run/secrets/freshrss";
      baseUrl = "0.0.0.0";
    };
    /*
    resilio = { random software for downloading 4k77
      enable = true;
      enableWebUI = true;
    };*/
  };

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg

    unstable.blockbench
  ];

  boot = {
    kernelPackages = pkgs.unstable.linuxPackages;
    initrd.availableKernelModules = [ "r8169" ]; # wake on lan fix
  };

  networking.interfaces."enp42s0".wakeOnLan.enable = true;

  hardware.nvidia = {
    package = pkgs.unstable.linuxPackages.nvidiaPackages.production; # more up to date drivers
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };
}