{ inputs, ... }:
{
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
  ];
  programs.plasma = {
    enable = true;
    overrideConfig = true;
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    workspace = {
      colorScheme = "BreezeDark";
      wallpaper = "${./wallpaper.jpg}";
    };
  };
}
