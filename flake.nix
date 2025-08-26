{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # NUR
    nur.url = "github:nix-community/NUR";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    arkenfox = {
      url = "github:dwarfmaster/arkenfox-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-emoji-linux = {
      url = "github:samuelngs/apple-emoji-linux";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-server.url = "github:nix-community/nixos-vscode-server";

    /*
      nixos-06cb-009a-fingerprint-sensor = {
        url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor?ref=24.11";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    */

    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    nixcord.url = "github:kaylorben/nixcord";

    # agenix
    agenix.url = "github:ryantm/agenix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nur,
      vscode-server,
      agenix,
      # nixos-06cb-009a-fingerprint-sensor,
      ...
    }@inputs:
    let
      username = "alex";
      system = "x86_64-linux";
      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            host = "desktop";
            inherit self inputs username;
          };
          modules = [
            ./hosts/desktop
            vscode-server.nixosModules.default
            agenix.nixosModules.default
            {
              nixpkgs.overlays = [
                nur.overlays.default
                overlay-unstable

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
                      ./modules/home/usbredir-blacklist.patch
                    ];
                  });
                })

                # Thunar/xarchiver fix: https://github.com/NixOS/nixpkgs/issues/248192
                (self: super: {
                  xarchiver = super.xarchiver.overrideAttrs (old: {
                    postInstall = ''
                      rm -rf $out/libexec
                    '';
                  });

                  xfce = super.xfce.overrideScope (
                    xself: xsuper: {
                      thunar-archive-plugin = xsuper.thunar-archive-plugin.overrideAttrs (old: {
                        postInstall = ''
                          cp ${super.xarchiver}/libexec/thunar-archive-plugin/* $out/libexec/thunar-archive-plugin/
                        '';
                      });
                    }
                  );
                })
              ];
            }
          ];
        };

        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            host = "laptop";
            inherit self inputs username;
          };
          modules = [
            ./hosts/laptop
            agenix.nixosModules.default
            {
              nixpkgs.overlays = [
                nur.overlays.default
                overlay-unstable

                (final: prev: {
                  usbredir = prev.usbredir.overrideAttrs (previousAttrs: {
                    patches = [
                      ./modules/home/usbredir-blacklist.patch
                    ];
                  });
                })

                # Thunar/xarchiver fix: https://github.com/NixOS/nixpkgs/issues/248192
                (self: super: {
                  xarchiver = super.xarchiver.overrideAttrs (old: {
                    postInstall = ''
                      rm -rf $out/libexec
                    '';
                  });

                  xfce = super.xfce.overrideScope (
                    xself: xsuper: {
                      thunar-archive-plugin = xsuper.thunar-archive-plugin.overrideAttrs (old: {
                        postInstall = ''
                          cp ${super.xarchiver}/libexec/thunar-archive-plugin/* $out/libexec/thunar-archive-plugin/
                        '';
                      });
                    }
                  );
                })
              ];
            }
            # nixos-06cb-009a-fingerprint-sensor.nixosModules."06cb-009a-fingerprint-sensor"
          ];
        };
      };
    };
}
