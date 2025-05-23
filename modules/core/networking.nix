{ pkgs, host, ... }:
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    firewall.enable = false;
    interfaces."enp42s0".wakeOnLan.enable = true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}