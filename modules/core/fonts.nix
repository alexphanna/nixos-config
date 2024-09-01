{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      material-icons
      fira-code
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];
  };
}