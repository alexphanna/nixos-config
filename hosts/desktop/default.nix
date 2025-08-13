{ pkgs, pkgs-unstable, config, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ]
  ++ [ (import ./wireguard.nix) ]
  ++ [ (import ./qbittorrent.nix) ]
  ++ [ (import ./virtualization.nix) ];

  services = {
    xserver.videoDrivers = [ "nvidia" ];
    jellyfin.enable = true;
    audiobookshelf = {
      enable = true;
      host = "0.0.0.0";
    };
    vscode-server.enable = true;
    freshrss = {
      enable = true;
      passwordFile = "/run/secrets/freshrss";
      baseUrl = "0.0.0.0";
    };
    sunshine = {
      enable = true;
      # Enable nvenc support
      package = pkgs.sunshine.override {
        cudaSupport = true;
      };
    };
    /* random software for downloading 4k77
    resilio = { 
      enable = true;
      enableWebUI = true;
    };
    */
  };

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg

    unstable.blockbench
  ];

  boot = {
    initrd.availableKernelModules = [ "r8169" ]; # wake on lan fix
  };

  networking.interfaces."enp42s0".wakeOnLan.enable = true;

  /*environment.sessionVariables = {
    DISPLAY = ":0"; # https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2getting__started.html#start-sunshine-over-ssh-linuxx11
  };*/

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.production;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };
}