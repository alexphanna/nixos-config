{ pkgs, inputs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      material-symbols
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      jetbrains-mono
      vista-fonts
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
