{ pkgs, ... }: 
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscjava.vscode-java-pack
      bbenoist.nix
      ms-python.python
      ms-dotnettools.csdevkit
    ];

    userSettings = {
      "java.jdt.ls.java.home" = "${pkgs.jdk23}";
      "workbench.colorTheme" = "Default Dark+";
      "files.autoSave" = "afterDelay";
    };
  };

  home.sessionVariables = {
    EDITOR = "code --wait";
    SUDO_EDITOR = "code --wait";
    VISUAL = "code --wait";
  };
}