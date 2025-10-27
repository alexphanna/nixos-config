{ pkgs, host, ... }:
{
  home.packages = with pkgs; [
    (nixd.overrideAttrs (oldAttrs: {
      src = fetchFromGitHub {
        owner = "oandrew";
        repo = "nixd";
        rev = "4cd9d17b30fc3bdc8becdd98d91dc3e305c6eb3d";
        hash = "sha256-T1NvNy57LKnxkdACMujmhV+LFlqBV6b41CfqFWlriVw=";
      };
    }))
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
