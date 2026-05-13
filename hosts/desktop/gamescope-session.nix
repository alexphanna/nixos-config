{ pkgs, ... }:
{
  programs = {
    steam = {
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
          "ENABLE_HDR_WSI" = "1";
        };
      };
    };
    gamescope = {
      enable = true;
      capSysNice = false;
    };
  };
  environment.systemPackages = with pkgs; [
    gamescope-wsi # HDR won't work without this
    jq
    (pkgs.writeScriptBin "steamos-session-select" ''
      #!/usr/bin/env zsh

      pkill -f gamescope
      sway --unsupported-gpu
      exec steam-gamescope
    '')
  ];
}