{ pkgs, inputs, ... }:
let
  material-symbols-filled = pkgs.callPackage ./../../packages/material-symbols-filled.nix { };
in
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      # material-symbols
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      jetbrains-mono
      vista-fonts
      material-symbols-filled
    ] ++ [
      inputs.apple-emoji-linux.packages.${system}.default
    ];

    fontconfig = {
      defaultFonts = {
        emoji = [ "Apple Color Emoji" ];
        monospace = [ "JetBrains Mono" ];
      };
    };
  };
}
