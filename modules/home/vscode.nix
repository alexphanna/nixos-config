{ pkgs, ... }: 
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    extensions = with pkgs.vscode-extensions; [
      vscjava.vscode-java-pack
      redhat.java
      bbenoist.nix
      ms-python.python
      ms-vscode-remote.remote-ssh
      esbenp.prettier-vscode
      james-yu.latex-workshop
      dart-code.flutter
    ];

    userSettings = {
      "java.jdt.ls.java.home" = "${pkgs.jdk23}";
      "workbench.colorTheme" = "Default Dark+";
      "files.autoSave" = "afterDelay";
      "workbench.statusBar.visible" = false;
      "editor.minimap.enabled" = false;
      "editor.formatOnSave" = true;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "update.mode" = "none";
      "security.workspace.trust.untrustedFiles" = "never";
    };
  };

  home.sessionVariables = {
    EDITOR = "code --wait --new-window";
    SUDO_EDITOR = "code --wait --new-window";
    VISUAL = "code --wait --new-window";
  };
}