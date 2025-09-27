{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [ # cannot include extension pack
        # ms-vscode.cpptools-extension-pack
        ms-vscode.cpptools
        # ms-vscode.cpptools-themes
        ms-vscode.cmake-tools
        
        # ms-vscode-remote.vscode-remote-extensionpack
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit

        # vscjava.vscode-java-pack
        redhat.java
        vscjava.vscode-java-debug
        vscjava.vscode-java-test 
        # vscjava.vscode-maven
        # vscjava.vscode-gradle
        vscjava.vscode-java-dependency
        visualstudioexptteam.vscodeintellicode

        jnoortheen.nix-ide
        ms-python.python
        esbenp.prettier-vscode
        james-yu.latex-workshop
        dart-code.flutter
        tamasfe.even-better-toml
        jbockle.jbockle-format-files
        adpyke.codesnap
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
        "git.openRepositoryInParentFolders" = "never";
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
  };

  home.sessionVariables = {
    EDITOR = "code --wait --new-window";
    SUDO_EDITOR = "code --wait --new-window";
    VISUAL = "code --wait --new-window";
  };
}
