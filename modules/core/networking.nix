{ pkgs, host, ... }:
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 25565 ]; # port for mc
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}