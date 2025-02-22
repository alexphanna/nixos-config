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
    chromium
    streamlink
    ffmpeg
    davinci-resolve
    
    # gaming
    (prismlauncher.override { jdks = [ jdk8 jdk21 ]; })
    protonup
    lutris

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
    unrar
    nix-prefetch-git
    yt-dlp
    fastfetch
    p7zip
    discordchatexporter-cli
    qdirstat
    openrgb-with-all-plugins
    xwinwrap
    xarchiver
    killall

    # programming
    nodejs
    python3Full
    jdk23
    typescript
    texlive.combined.scheme-full
    vim

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
        rev = "13f7ee4ffe42088fd43ccd771707c777848da294";
        hash = "sha256-KV8HPF910BUI3frfULR0WX3NaViR9mgLa6TsdNbtO6U=";
      };
      # src = /home/alex/Documents/dmenu;
    }))
  ];
}