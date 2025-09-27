{
  pkgs,
  inputs,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      # daily
      spotify
      gimp
      chromium
      obsidian
      stremio
      openrgb-with-all-plugins

      # useful GTK and QT apps
      galculator
      cheese # webcam
      foliate # for reading books
      resources
      nicotine-plus
      protonvpn-gui
      gucharmap
      xarchiver
      qdirstat
      qbittorrent
      gparted
      angryipscanner
      pavucontrol
      mcaselector
      # libreoffice
      libreoffice-qt
      hunspell
      hunspellDicts.en_US

      # gaming
      (prismlauncher.override {
        jdks = [
          jdk8
          jdk17
          jdk21
        ];
      })

      # utilities
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
      xwinwrap
      killall
      libnatpmp
      mkvtoolnix
      ffmpeg
      neofetch
      pkg-config
      paprefs
      jq
      mailutils
      ddcutil
      streamlink

      # programming
      nodejs
      (python3.withPackages (python-pkgs: with python-pkgs; [
          psutil
          jobspy
      ]))
      jdk23
      typescript
      texlive.combined.scheme-full
      vim
      uv
      flutter
      nixfmt-rfc-style
      gnat15
      nixd
      powershell

      # custom packages
      (st.overrideAttrs (oldAttrs:  {
        src = fetchFromGitHub {
          owner = "alexphanna";
          repo = "st";
          rev = "1fbc35dd244f37ca44af59bc0883abee40410d0b";
          hash = "sha256-1Wtj/yyTepzgJzCpsHRZSsCK2D4QJze2Igk7ujPMU3Y=";
        };
        # src = /home/alex/Documents/st;
      }))
      (dmenu.overrideAttrs (oldAttrs:  {
        src = fetchFromGitHub {
          owner = "alexphanna";
          repo = "dmenu";
          rev = "19ee02a32e581a443bafea5177d17d03285fb50d";
          hash = "sha256-J9RIOiLEYAlbQhnt8IHznIur4dixExsPMVYr6EEXKiQ=";
        };
        # src = /home/alex/Documents/dmenu;
      }))
    ]
    ++ [
      inputs.apple-emoji-linux.packages.${system}.default
    ];
}
