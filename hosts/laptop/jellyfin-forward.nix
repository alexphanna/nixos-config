{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    socat
  ];
  # allows me to watch jellyfin on TVs that can't use vpns
  systemd.services.jellyfin-forward = {
    enable = true;
    description = "Jellyfin Port Forwarding";
    after = [
      "network.target"
      "wg-quick-wg0.service"
    ]; # Adjust if your WireGuard service name differs
    wants = [ "wg-quick-wg0.service" ];
    serviceConfig = {
      ExecStart = "${pkgs.socat}/bin/socat TCP-LISTEN:8096,bind=0.0.0.0,reuseaddr,fork TCP:192.168.0.39:8096";
      Restart = "always";
      RestartSec = 5;
      User = "root"; # Requires root for port binding
    };
    wantedBy = [ "multi-user.target" ];
  };
}
