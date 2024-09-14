{ pkgs, ... }: 
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };

  home.sessionVariables = {
    EDITOR = "code --wait";
    SUDO_EDITOR = "code --wait";
    VISUAL = "code --wait";
  };
}