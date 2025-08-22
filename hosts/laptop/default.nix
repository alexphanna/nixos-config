{ pkgs, config, username, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ]
  ++ [ (import ./wireguard.nix) ];

  powerManagement.enable = true;

  environment.systemPackages = with pkgs; [
    acpilight
    powertop
    moonlight-qt
    # fprintd
    socat
  ];

  hardware.bluetooth.enable = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # For Broadwell (2014) or newer processors. LIBVA_DRIVER_NAME=iHD
      # intel-vaapi-driver # For older processors. LIBVA_DRIVER_NAME=i965
    ];
  };
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Optionally, set the environment variable

  boot.kernelParams = [ "snd_hda_intel.dmic_detect=0" ];  # Fix no speakers

  virtualisation.spiceUSBRedirection.enable = true; 

  # allows me to watch jellyfin on TVs that can't use vpns
  systemd.services.jellyfin-forward = {
    enable = true;
    description = "Jellyfin Port Forwarding";
    after = [ "network.target" "wg-quick-wg0.service" ]; # Adjust if your WireGuard service name differs
    wants = [ "wg-quick-wg0.service" ];
    serviceConfig = {
      ExecStart = "${pkgs.socat}/bin/socat TCP-LISTEN:8096,bind=0.0.0.0,reuseaddr,fork TCP:192.168.0.39:8096";
      Restart = "always";
      RestartSec = 5;
      User = "root"; # Requires root for port binding
    };
    wantedBy = [ "multi-user.target" ];
  };

  services = {
    udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
    '';
    
    tlp = {
      enable = true;
      settings = {
        START_CHARGE_THRESH_BAT0 = 75;
        STOP_CHARGE_THRESH_BAT0 = 80;
        START_CHARGE_THRESH_BAT1 = 75;
        STOP_CHARGE_THRESH_BAT1 = 80;
      };
    };

    throttled.enable = true;
    blueman.enable = true;
    fwupd.enable = true; # bios updating

    # fingerprint
    /*"06cb-009a-fingerprint-sensor" = {                                 
      enable = true;                                                            
      backend = "libfprint-tod";                                                
      calib-data-file = ./.calib-data.bin;                
    };*/
  };
}