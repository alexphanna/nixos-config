{ pkgs, ... }:
{
  services.freshrss = {
    enable = false;
    authType = "none";
    baseUrl = "http://0.0.0.0";
    extensions = with pkgs.freshrss-extensions; [
      youtube
    ];
  };
}
