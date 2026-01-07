{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    config = {
      plugins = {
        biggerStreamPreview.enable = true;
        fakeNitro.enable = true;
        volumeBooster.enable = true;
        ClearURLs.enable = true;
        showHiddenChannels.enable = true;
        viewIcons.enable = true;
      };
    };
  };
  
  home.packages = with pkgs; [
    discordchatexporter-cli
    xdg-utils # Required to open links in firefox
  ];
}
