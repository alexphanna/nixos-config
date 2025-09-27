{ pkgs, inputs, ... }:
let
  material-icon = pkgs.callPackage ./../../packages/material-icon.nix  { inherit pkgs; };
in
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      material-icon
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      inputs.apple-fonts.packages.${pkgs.system}.sf-pro
      inputs.apple-fonts.packages.${pkgs.system}.sf-mono
      vista-fonts
    ];

    fontconfig = {
      defaultFonts = {
        emoji = [ "Apple Color Emoji" ];
        monospace = [ "SF Mono" ];
      };
    };
  };
}
