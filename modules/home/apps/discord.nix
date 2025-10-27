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
        clearURLs.enable = true;
        showHiddenChannels.enable = true;
      };
    };
  };
  
  home.packages = with pkgs; [
    discordchatexporter-cli
  ];
}
