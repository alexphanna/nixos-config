# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  # Configure your nixpkgs instance
  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
      inputs.nur.overlay
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".xinitrc".source = ./config/xorg/.xinitrc;
    "wallpaper.jpg".source = ./config/wallpaper.jpg;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/alex/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "vscode --wait";
    QT_QPA_PLATFORMTHEME = "gtk2";
    QT_STYLE_OVERRIDE = "Adwaita-dark"; # Optional, if needed
    GTK_THEME = "Adwaita-dark"; # For GTK applications
  };

  # Dark mode for everything
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
    };
  };
  

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.firefox = {
    enable = true;

    profiles."Alex" = {
      name = "Alex";
      id = 0;
      isDefault = true;

      settings = {
        # disable stuff
        "extensions.pocket.enabled" = false;
        "services.sync.enabled" = false;

        "browser.toolbars.bookmarks.visibility" = "never"
      };

      extensions = with pkgs; [
        nur.repos.rycee.firefox-addons.ublock-origin
        nur.repos.rycee.firefox-addons.sponsorblock
      ];
    };
  };

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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      code = "code --wait";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtra = ''
      bindkey "^[[1;3C" forward-word
      bindkey "^[[1;3D" backward-word
    '';
  };


  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
