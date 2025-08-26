{ pkgs, ... }:
{
  # Dark mode for everything
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk2";
    QT_STYLE_OVERRIDE = "Adwaita-dark"; # Optional, if needed
    GTK_THEME = "Adwaita-dark"; # For GTK applications
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";
    _JAVA_AWT_WM_NONREPARENTING = 1;
    AWT_TOOLKIT = "MToolkit";
  };
}
