{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    spotify
    gimp
    obsidian
    galculator
    foliate # for reading books
    resources # task manager
    protonvpn-gui
    gucharmap
    inkscape
    carla

    #inputs.nixohess.packages.${pkgs.stdenv.hostPlatform.system}.stremio-linux-shell
  ];
}
