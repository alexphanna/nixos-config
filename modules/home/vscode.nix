{ pkgs, ... }: 
{
  programs.vscode = {
    enable = true;
    userSettings = {
      "workbench.colorTheme" = "Default Dark+";
      "files.autoSave" = "afterDelay";
      "window.dialogStyle" = "custom";
      "window.titleBarStyle" = "custom";
      "extensions.autoUpdate" = true;
      "extensions.autoCheckUpdates" = true;
      "editor.minimap.enabled" = false;
    };

    extensions = with pkgs.vscode-extensions; [
      # General
      github.copilot
      github.copilot-chat

      # Nix
      bbenoist.nix

      # Python
      ms-python.python
      ms-python.vscode-pylance
      
      # Java
      vscjava.vscode-java-pack
    ];
  };

  home.sessionVariables = {
    EDITOR = "code --wait";
    SUDO_EDITOR = "code --wait";
    VISUAL = "code --wait";
  };
}