{ inputs, ... }:
{
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
  ];
  programs.plasma = {
    enable = true;
    workspace = {
      colorScheme = "BreezeDark";
      wallpaper = "${./wallpaper.jpg}";
    };
  };
}
