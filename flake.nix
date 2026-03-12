{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    stremio-linux-shell.url = "github:thunze/nixpkgs";

    # NUR
    nur.url = "github:nix-community/NUR";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flatpaks.url = "github:in-a-dil-emma/declarative-flatpak/latest";

    # FIX: bump when https://github.com/samuelngs/apple-emoji-ttf/issues/101 fixed
    apple-emoji-linux = {
      url = "github:samuelngs/apple-emoji-linux/b22ae7f";
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
      accentColor = "#4080c0";
      backgroundColor = "#00000040";
      foregroundColor = "#FFFFFF";
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
            inherit self inputs username accentColor backgroundColor foregroundColor;
          };
          modules = [
            ./hosts/desktop
            vscode-server.nixosModules.default
            {
              nixpkgs.overlays = [
                nur.overlays.default
                overlay-unstable
              ];
            }
          ];
        };

        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            host = "laptop";
            inherit self inputs username accentColor backgroundColor foregroundColor;
          };
          modules = [
            ./hosts/laptop
            {
              nixpkgs.overlays = [
                nur.overlays.default
                overlay-unstable
              ];
            }
          ];
        };
      };
    };
}
