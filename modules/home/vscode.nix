{ pkgs, ... }: 
{
  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      vscjava.vscode-java-pack
      bbenoist.nix
      ms-python.python
      ms-vscode-remote.remote-ssh
    ];

    userSettings = {
      "java.jdt.ls.java.home" = "${pkgs.jdk23}";
      "workbench.colorTheme" = "Default Dark+";
      "files.autoSave" = "afterDelay";
      "workbench.statusBar.visible" = false;
      "editor.minimap.enabled" = false;
    };
  };

  home.sessionVariables = {
    EDITOR = "code --wait --new-window";
    SUDO_EDITOR = "code --wait --new-window";
    VISUAL = "code --wait --new-window";
  };
}