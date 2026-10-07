{ pkgs, inputs, ... }:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.openASAR.enable = false;
    discord.vencord.enable = false;
    config.plugins = {
      biggerStreamPreview.enable = true;
      volumeBooster.enable = true;
      clearUrls.enable = true;
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
