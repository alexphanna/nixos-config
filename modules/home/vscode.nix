{ pkgs, inputs, host, ... }:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # cannot include extension packs
        # c++
        ms-vscode.cpptools
        # ms-vscode.cpptools-themes
        ms-vscode.cmake-tools

        # remote
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit

        # java
        redhat.java
        vscjava.vscode-java-debug
        vscjava.vscode-java-test
        # vscjava.vscode-maven
        # vscjava.vscode-gradle
        vscjava.vscode-java-dependency
        visualstudioexptteam.vscodeintellicode

        # python
        ms-python.python
        ms-python.vscode-pylance

        jnoortheen.nix-ide
        esbenp.prettier-vscode
        james-yu.latex-workshop
        dart-code.flutter
        tamasfe.even-better-toml
        jbockle.jbockle-format-files
        adpyke.codesnap
        mechatroner.rainbow-csv
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
        "editor.fontFamily" = "'monospace', 'Material Symbols Rounded', monospace";
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings".nixd = {
          formatting.command = ["nixfmt"];

          options = {
            nixos.expr = "(builtins.getFlake \"/home/alex/Documents/nixos-config\").nixosConfigurations.${host}.options";
            home-manager.expr = "(builtins.getFlake \"/home/alex/Documents/nixos-config\").nixosConfigurations.${host}.options.home-manager.users.type.getSubOptions []";
          };
        };
        "editor.fontLigatures" = true;
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "code --wait --new-window";
    SUDO_EDITOR = "code --wait --new-window";
    VISUAL = "code --wait --new-window";
  };
}
