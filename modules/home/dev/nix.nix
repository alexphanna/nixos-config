{ pkgs, host, ... }:
{
  home.packages = with pkgs; [
    nixd
    nixfmt-rfc-style
    nix-prefetch-git
  ];
  programs.vscode.profiles.default = {
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];
    userSettings = {
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
      };
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings".nixd = {
        formatting.command = ["nixfmt"];

        options = {
          nixos.expr = "(builtins.getFlake \"/home/alex/Documents/nixos-config\").nixosConfigurations.${host}.options";
          home-manager.expr = "(builtins.getFlake \"/home/alex/Documents/nixos-config\").nixosConfigurations.${host}.options.home-manager.users.type.getSubOptions []";
        };
      };
    };
  };
}
