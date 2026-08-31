{ inputs, ... }:
{
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
  ];
  programs.plasma = {
    enable = true;
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    workspace = {
      colorScheme = "BreezeDark";
      wallpaper = "${./wallpaper.jpg}";
    };
  };
}
