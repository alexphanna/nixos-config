{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # NUR
    nur.url = "github:nix-community/NUR";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    arkenfox = {
      url = "github:dwarfmaster/arkenfox-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nur,
    ...
  } @ inputs: let
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
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # FIXME replace with your hostname
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { host="laptop"; inherit self inputs username ; };
        # > Our main nixos configuration file <
        modules = [ 
          (import ./hosts/laptop)
          {
            nixpkgs.overlays = [
              nur.overlay
              overlay-unstable

              # Thunar/xarchiver fix: https://github.com/NixOS/nixpkgs/issues/248192
              (self: super: {
                xarchiver = super.xarchiver.overrideAttrs (old: {
                  postInstall = ''
                    rm -rf $out/libexec
                  '';
                });

                xfce = super.xfce.overrideScope (xself: xsuper: {
                  thunar-archive-plugin = xsuper.thunar-archive-plugin.overrideAttrs (old: {
                    postInstall = ''
                      cp ${super.xarchiver}/libexec/thunar-archive-plugin/* $out/libexec/thunar-archive-plugin/
                    '';
                  });
                });
              })
            ];
          }
        ];
      };
    };
  };
}
