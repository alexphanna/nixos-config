{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools-extension-pack
      ms-vscode-remote.vscode-remote-extensionpack
      vscjava.vscode-java-pack
      jnoortheen.nix-ide
      ms-python.python
      esbenp.prettier-vscode
      james-yu.latex-workshop
      dart-code.flutter
      tamasfe.even-better-toml
      jbockle.jbockle-format-files
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
      "editor.fontFamily" = "'SF Mono', 'monospace', monospace";

      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
      };
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "nixfmt" ];
          };
        };
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "code --wait --new-window";
    SUDO_EDITOR = "code --wait --new-window";
    VISUAL = "code --wait --new-window";
  };
}
