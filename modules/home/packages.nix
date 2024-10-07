{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # basic apps
    discord
    spotify
    gpodder
    obsidian
    galculator
    gnome.gucharmap
    gimp
    liferea
    chromium

    # utils
    aria2
    git
    xcompmgr
    feh
    bc
    dconf
    scrot
    tesseract
    xclip
    unzip
    nix-prefetch-git
    yt-dlp
    fastfetch
    p7zip

    # programming
    nodejs
    python3
    jdk22

    # custom packages
    (st.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "alexphanna";
        repo = "st";
        rev = "b35c560d0f3c213927760dc51ff49e3bb2073e37";
        hash = "sha256-FAfxQ2hiKF4LM5uFjQLakWSKDPmTTKuKXiJnPsELoOY=";
      };
    }))
    (dmenu.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "alexphanna";
        repo = "dmenu";
        rev = "5ab97d0c8a38e4aed7f9353eb8c573ee5f48be70";
        hash = "sha256-+vRMPhYKb8SSvC3XvNXDLubcviRVIluLwP7uP2U6OO0=";
      };
    }))
  ];
}