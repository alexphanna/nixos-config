{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # cannot include extension packs

        # remote
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit

        esbenp.prettier-vscode
        tamasfe.even-better-toml
        jbockle.jbockle-format-files
        mechatroner.rainbow-csv
      ];

      userSettings = {
        "workbench.colorTheme" = "Dark+";
        "files.autoSave" = "afterDelay";
        "workbench.statusBar.visible" = false;
        "editor.minimap.enabled" = false;
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "update.mode" = "none";
        "security.workspace.trust.untrustedFiles" = "never";
        "git.openRepositoryInParentFolders" = "never";
        "editor.fontFamily" = "'monospace', 'Material Symbols Rounded', monospace";
        "editor.fontLigatures" = true;
        "chat.disableAIFeatures" = true;
        "window.restoreWindows" = "none";
        "telemetry.feedback.enabled" = false;
        "telemetry.telemetryLevel" = "off";
        "extensions.ignoreRecommendations" = true;
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "code --wait --new-window";
    SUDO_EDITOR = "code --wait --new-window";
    VISUAL = "code --wait --new-window";
  };
}
