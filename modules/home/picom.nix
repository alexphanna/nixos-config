{
  services.picom = {
    enable = true; 
    settings = {
      unredir-if-possible = false;
      backend = "glx";
      vsync = true;

      blur = { 
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
      corner-radius = 8.0;
      rounded-corners-exclude = [
        "class_g = 'dmenu'"
        "class_g = 'dwm'"
      ];
      blur-background-exclude = [
        "window_type = 'menu'"
        "window_type = 'dropdown_menu'"
        "window_type = 'popup_menu'"
        "window_type = 'tooltip'"
      ];
    };
  };
}