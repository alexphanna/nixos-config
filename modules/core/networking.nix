{ pkgs, host, ... }:
{
  networking = {
    hostName = "${host}";
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    firewall.enable = false;
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    openvpn
  ];
}
