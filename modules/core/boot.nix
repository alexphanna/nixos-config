{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelParams = [ "quiet" "initcall_blacklist=simpledrm_platform_driver_init" ];
    kernelModules = [ "hid-playstation" ];
    supportedFilesystems = [ "ntfs" ];
  };
  security.polkit.enable = true;
}
