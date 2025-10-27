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
              ];
            }
          ];
        };
      };
    };
}
