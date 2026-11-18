{ pkgs, host, ... }:
{
  home.packages = with pkgs; [
    nixd
    nixfmt
    nix-prefetch-git
  ];
  programs.vscode.profiles.default = {
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];
    userSettings = {
      # removes "Request textDocument/definition failed." error when editing nix files
      # source: https://github.com/nix-community/vscode-nix-ide/issues/482#issuecomment-3014989164
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
      };
      "nix.hiddenLanguageServerErrors" = [
        "textDocument/definition"
      ];
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings".nixd = {
        formatting.command = [ "nixfmt" ];

        options = {
          nixos.expr = "(builtins.getFlake \"/home/alex/Documents/nixos-config\").nixosConfigurations.${host}.options";
          home-manager.expr = "(builtins.getFlake \"/home/alex/Documents/nixos-config\").nixosConfigurations.${host}.options.home-manager.users.type.getSubOptions []";
        };
      };
    };
  };
}
