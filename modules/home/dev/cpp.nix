{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      gnat15
    ];
  };
  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    ms-vscode.cpptools
    # ms-vscode.cpptools-themes
    ms-vscode.cmake-tools
  ];
}
