{ pkgs, config, ... }:
{
  # Dark mode for everything
  gtk = {
    enable = false;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  dconf.settings."org/gnome/desktop/interface" = {
    gtk-theme = config.gtk.theme.name;
    icon-theme = config.gtk.iconTheme.name;
    color-scheme = "prefer-dark"; # Required for Firefox auto dark theme in wayland
  };

  home = {
    packages = with pkgs; [
      dconf
    ];
    sessionVariables = {
      GTK_THEME = "Adwaita-dark"; # For GTK applications
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };
}
