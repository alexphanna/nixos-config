{ pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    gimp
    libresprite
    galculator
    resources # task manager
    foliate
    protonvpn-gui
    
    (pkgs.callPackage "${
      pkgs.fetchFromGitHub {
        owner = "thunze";
        repo = "nixpkgs";
        rev = "f06f7b6b2c95aa149e180cd2d979f1f1cba921d3";
        sha256 = "sha256-z4ZetoftGWON/pt6eqHcC/Ltl6kWPBHXzPs/1TXcWmE=";
      }
    }/pkgs/by-name/st/stremio-linux-shell/package.nix" { })
  ];
}
