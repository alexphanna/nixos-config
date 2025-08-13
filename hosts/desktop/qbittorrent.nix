{
  inputs,
  pkgs,
  ...
}:
{
  services.qbittorrent = {
    enable = true;
    serverConfig = {
      Preferences = {
        WebUI = {
          AlternativeUIEnabled = false;
        };
      };
    };
  };
}