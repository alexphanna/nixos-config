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

    flatpaks.url = "github:in-a-dil-emma/declarative-flatpak/latest";

    apple-emoji-linux = {
      url = "github:samuelngs/apple-emoji-linux";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-server.url = "github:nix-community/nixos-vscode-server";

    nixcord.url = "github:kaylorben/nixcord";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nur,
      vscode-server,
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
                      ./patches/usbredir-blacklist.patch
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
                      ./patches/usbredir-blacklist.patch
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
      };
    };
}
