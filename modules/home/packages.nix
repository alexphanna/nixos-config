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
    gucharmap
    gimp
    liferea
    chromium
    streamlink
    
    # gaming
    snes9x
    cemu
    prismlauncher
    protonup

    # utils
    zip
    aria2
    git
    xcompmgr
    feh
    bc
    dconf
    scrot
    tesseract
    xclip
    xcolor
    unzip
    nix-prefetch-git
    yt-dlp
    fastfetch
    p7zip
    discordchatexporter-cli
    qdirstat
    openrgb-with-all-plugins

    # programming
    nodejs
    python3Full
    jdk23

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