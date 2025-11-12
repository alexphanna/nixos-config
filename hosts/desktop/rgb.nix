{ pkgs, ...}: 
{
  services.hardware.openrgb.enable = true;
  environment.systemPackages = with pkgs; [
    openrgb-with-all-plugins
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "mbedtls-2.28.10"
    "gradle-7.6.6"
  ];
}