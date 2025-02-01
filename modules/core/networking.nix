{ pkgs, host, ... }:
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}