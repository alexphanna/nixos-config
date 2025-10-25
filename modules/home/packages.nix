{
  pkgs,
  inputs,
  ...
}:
let
  stremio-enhanced = pkgs.callPackage ./../../packages/stremio-enhanced.nix { };
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
      wmenu

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

      # utilities
      zip
      aria2
      git
      xcompmgr
      feh
      bc
      dconf
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
      streamlink
      slurp
      dmg2img
      mpvpaper
      tesseract

      # programming
      nodejs
      (python3.withPackages (
        python-pkgs: with python-pkgs; [
          psutil
          jobspy
          faker
          pynput
          beautifulsoup4
          lxml
          pywinctl
          tkinter
          sklearn-compat
        ]
      ))
      jdk23
      typescript
      texlive.combined.scheme-full
      vim
      flutter
      nixfmt-rfc-style
      gnat15
      (nixd.overrideAttrs (oldAttrs:  {
        src = fetchFromGitHub {
          owner = "oandrew";
          repo = "nixd";
          rev = "4cd9d17b30fc3bdc8becdd98d91dc3e305c6eb3d";
          hash = "sha256-T1NvNy57LKnxkdACMujmhV+LFlqBV6b41CfqFWlriVw=";
        };
        # src = /home/alex/Documents/st;
      }))
      powershell
    ] ++ [
      inputs.apple-emoji-linux.packages.${system}.default
    ];
}
