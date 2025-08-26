{ inputs, ... }:
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
        callTimer.enable = true;
        clearURLs.enable = true;
        showHiddenChannels.enable = true;
      };
    };
  };
}
