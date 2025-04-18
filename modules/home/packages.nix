{ pkgs, pkgs-unstable, inputs, ... }:
{
  home.packages = with pkgs; [
    # basic apps
    (discord.override {
      withVencord = true;
    })
    spotify
    gpodder
    galculator
    gucharmap
    gimp
    chromium
    streamlink
    ffmpeg
    # davinci-resolve
    nicotine-plus
    openrgb-with-all-plugins
    protonvpn-gui
    qbittorrent
    
    # gaming
    (prismlauncher.override { jdks = [ jdk8 jdk17 jdk21 ]; })
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
    unrar
    nix-prefetch-git
    yt-dlp
    fastfetch
    p7zip
    discordchatexporter-cli
    qdirstat
    xwinwrap
    xarchiver
    killall
    neofetch
    libnatpmp
    mkvtoolnix

    # programming
    nodejs
    python3Full
    jdk23
    typescript
    texlive.combined.scheme-full
    vim
    uv
    flutter

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
        rev = "19ee02a32e581a443bafea5177d17d03285fb50d";
        hash = "sha256-J9RIOiLEYAlbQhnt8IHznIur4dixExsPMVYr6EEXKiQ=";
      };
      # src = /home/alex/Documents/dmenu;
    }))
  ]
  ++
  [
    inputs.apple-emoji-linux.packages.${system}.default
  ];
}