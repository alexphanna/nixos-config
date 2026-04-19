{ pkgs, ... }:
{
  programs.vesktop = {
    enable = true;
    vencord.settings.plugins = {
      BiggerStreamPreview.enabled = true;
      FakeNitro.enabled = true;
      VolumeBooster.enabled = true;
      ClearURLs.enabled = true;
      ShowHiddenChannels.enabled = true;
      YoutubeAdblock.enabled = true;
    };
  };
  
  home.packages = with pkgs; [
    (pkgs.writeScriptBin "Discord" "vesktop")
    discordchatexporter-cli
    xdg-utils # Required to open links in firefox
  ];
}
