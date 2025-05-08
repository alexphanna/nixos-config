{ pkgs, inputs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      material-symbols
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      inputs.apple-fonts.packages.${pkgs.system}.sf-pro
      inputs.apple-fonts.packages.${pkgs.system}.sf-mono
    ];

    fontconfig = {
      defaultFonts = {
        emoji = [ "Apple Color Emoji" ];
        monospace = [ "SF Mono" ];
      };
    };
  };
}