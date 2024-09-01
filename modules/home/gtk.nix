{ pkgs, ... }:
{
  # Dark mode for everything
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
    };
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk2";
    QT_STYLE_OVERRIDE = "Adwaita-dark"; # Optional, if needed
    GTK_THEME = "Adwaita-dark"; # For GTK applications
  };
}