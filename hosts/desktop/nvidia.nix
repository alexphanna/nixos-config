{ config, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "580.105.08";
      sha256_64bit = "sha256-2cboGIZy8+t03QTPpp3VhHn6HQFiyMKMjRdiV2MpNHU=";
      openSha256 = "sha256-FGmMt3ShQrw4q6wsk8DSvm96ie5yELoDFYinSlGZcwQ=";
      settingsSha256 = "sha256-YvzWO1U3am4Nt5cQ+b5IJ23yeWx5ud1HCu1U0KoojLY=";
      persistencedSha256 = "sha256-qh8pKGxUjEimCgwH7q91IV7wdPyV5v5dc5/K/IcbruI=";
    };
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
  };
}