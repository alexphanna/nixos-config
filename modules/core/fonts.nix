{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      material-symbols
      fira-code
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];
  };
}