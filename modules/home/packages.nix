{
  pkgs,
  inputs,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      spotify
      galculator
      gimp
      chromium
      streamlink
      openrgb-with-all-plugins
      protonvpn-gui
      # qbittorrent
      obsidian
      nicotine-plus
      teamspeak3
      resources
      stremio
      cheese # webcam
      foliate # for reading books
      telegram-desktop

      # gaming
      (prismlauncher.override {
        jdks = [
          jdk8
          jdk17
          jdk21
        ];
      })

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
      libnatpmp
      mkvtoolnix
      ffmpeg
      gucharmap
      neofetch
      gparted
      angryipscanner
      pkg-config
      pavucontrol
      paprefs
      jq
      mcaselector
      mailutils

      libreoffice-qt
      hunspell
      hunspellDicts.en_US

      # programming
      nodejs
      (python3.withPackages (python-pkgs: with python-pkgs; [
          psutil
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
