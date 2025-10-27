{
  pkgs,
  config,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  system.activationScripts."mpv-link" = {
    text = ''
      ln -sf ${config.home-manager.users.alex.programs.mpv.finalPackage}/bin/mpv /usr/bin/mpv
    '';
  };

  time.timeZone = "America/New_York";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
      flake-registry = "";
      download-buffer-size = 524288000;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    overlays = [
      (final: prev: {
        jellyfin-web = prev.jellyfin-web.overrideAttrs (
          finalAttrs: previousAttrs: {
            installPhase = ''
              runHook preInstall

              # this is the important line
              sed -i "s#</head>#<script src=\"configurationpage?name=skip-intro-button.js\"></script></head>#" dist/index.html

              mkdir -p $out/share
              cp -a dist $out/share/jellyfin-web

              runHook postInstall
            '';
          }
        );
      })

      (final: prev: {
        usbredir = prev.usbredir.overrideAttrs (previousAttrs: {
          patches = [
            ./patches/usbredir-blacklist.patch
          ];
        });
      })

      # Thunar/xarchiver fix: https://github.com/NixOS/nixpkgs/issues/248192
      (final: prev: {
        xarchiver  = prev.xarchiver.overrideAttrs (old: {
            postInstall = ''
                rm -rf $out/libexec
            '';
        });

        xfce = prev.xfce.overrideScope (xfinal: xprev: {
          thunar-archive-plugin = xprev.thunar-archive-plugin.overrideAttrs (old: {
              postInstall = ''
                  cp ${final.xarchiver}/libexec/thunar-archive-plugin/* $out/libexec/thunar-archive-plugin/
              '';
          });
        });
      })
    ];
  };
  system.stateVersion = "24.11";
}
