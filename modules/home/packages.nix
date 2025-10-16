{
  pkgs,
  inputs,
  ...
}:
let
  stremio-enhanced = pkgs.callPackage ./../../packages/stremio-enhanced.nix  { };
in
{
  home.packages =
    with pkgs;
    [
      # daily
      unstable.spotify
      gimp
      chromium
      obsidian
      # stremio
      stremio-enhanced
      openrgb-with-all-plugins

      # useful GTK and QT apps
      galculator
      gscreenshot
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
      moonlight-qt

      # gaming
      (prismlauncher.override {
        jdks = [
          jdk8
          jdk17
          jdk21
        ];
      })
      mcpelauncher-client

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
      devour

      # programming
      nodejs
      (python3.withPackages (python-pkgs: with python-pkgs; [
          psutil
          jobspy
          faker
          pynput
          beautifulsoup4
          lxml
          pywinctl
          tkinter

          sklearn-compat
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
      wmenu
    ]
    ++ [
      inputs.apple-emoji-linux.packages.${system}.default
    ];
}
