{ pkgs, ... }:
{
  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
        args = [
          "--output-width 3840"
          "--output-height 2160"
          "--fullscreen"
          "--prefer-output HDMI-A-1"
          "--hdr-enabled"
          "--steam"
          "--mangoapp"
        ];
        steamArgs = [
          "-steamos3"
          "-steamdeck"
          "-gamepadui"
          "-pipewire-dmabuf"
        ];
        env = {
          "DXVK_HDR" = "1";
        };
      };
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    gamescope = {
      enable = true;
      capSysNice = false;
    };
  };
  environment.systemPackages = with pkgs; [
    gamescope-wsi # HDR won't work without this
    protonup-qt

    jq
    chromium
  ];
}
