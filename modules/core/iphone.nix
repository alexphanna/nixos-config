{ pkgs, ... }:
{
  services = {
    avahi = {
      enable = true;
      nssmdns = true;  # printing
      publish = {
        enable = true;
        addresses = true;
        workstation = true;
        userServices = true;
      };
    };
    usbmuxd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    libimobiledevice
    ifuse # optional, to mount using 'ifuse'
    ipatool
    uxplay
  ];
}