{ pkgs, ... }:
{
  boot.kernelModules = [ 
    "vhci-hcd" 
    "usbip_host"
    "usbip_core"
  ];
  environment.systemPackages = with pkgs; [
    linuxPackages.usbip
  ];
}
# source: https://github.com/ritiek/dotfiles/blob/b2cf6d38264660ef9ff86fd2cd1c5fcc1c3e4771/modules/usbip.nix