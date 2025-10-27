{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      flutter
    ];
  };
  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    dart-code.flutter
  ];
}
