{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    acpilight
  ];

   # Fix no speakers
  boot.kernelParams = [ "snd_hda_intel.dmic_detect=0" ];
  
  powerManagement.enable = true;

  services = {
    # Fix brightness
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
    fwupd.enable = true;
  };
}