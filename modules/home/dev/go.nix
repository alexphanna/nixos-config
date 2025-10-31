{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      go
    ];
  };
  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    golang.go
  ];
}