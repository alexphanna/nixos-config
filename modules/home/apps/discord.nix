{ pkgs, inputs, ... }:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.openASAR.enable = false;
    config.plugins = {
      biggerStreamPreview.enable = true;
      fakeNitro.enable = true;
      volumeBooster.enable = true;
      ClearURLs.enable = true;
      # showHiddenChannels.enable = true; BROKEN
      youtubeAdblock.enable = true;
    };
  };

  home.packages = with pkgs; [
    # (pkgs.writeScriptBin "Discord" "vesktop")
    discordchatexporter-cli
    xdg-utils # Required to open links in firefox
  ];
}
