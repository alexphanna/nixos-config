{ pkgs, host, ... }:
{
  networking.hostName = "${host}";
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}