{ pkgs, pkgs-unstable, config, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  services = {
    xserver.videoDrivers = ["nvidia"];
    jellyfin.enable = true;
    audiobookshelf = {
      enable = true;
      host = "0.0.0.0";
    };
  };

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg

    audiobookshelf
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

  # Virtualization

  users.users.${username}.extraGroups = [ "libvirtd" "kvm" ];

  environment.systemPackages = with pkgs; [
    # ultimate-macOS-kvm dependencies
    libvirt
    qemu_full
    dnsmasq
    samba
  ];

  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
  };
}