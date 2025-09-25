{ pkgs, config, ... }:
{
  # Dark mode for everything
  gtk = {
    enable = true;
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
  };

  home.sessionVariables = {
    GTK_THEME = "Adwaita-dark"; # For GTK applications
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";
    _JAVA_AWT_WM_NONREPARENTING = 1;
    AWT_TOOLKIT = "MToolkit";
  };
}
