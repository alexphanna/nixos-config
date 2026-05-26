{
  lib,
  pkgs,
  host,
  config,
  accentColor,
  backgroundColor,
  foregroundColor,
  ...
}:
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      defaultWorkspace = "workspace number 1";
      modifier = "Mod4";
      colors = {
        unfocused = {
          background = backgroundColor;
          border = backgroundColor;
          childBorder = backgroundColor;
          indicator = backgroundColor;
          text = foregroundColor;
        };
        focused = {
          background = backgroundColor;
          border = backgroundColor;
          childBorder = backgroundColor;
          indicator = backgroundColor;
          text = foregroundColor;
        };
        focusedInactive = {
          background = backgroundColor;
          border = backgroundColor;
          childBorder = backgroundColor;
          indicator = backgroundColor;
          text = foregroundColor;
        };
      };
      fonts.size = 10.0;
      window = {
        border = 0;
        titlebar = false;
      };
      floating = {
        border = 0;
        titlebar = false;
      };
      gaps = {
        inner = 16;
      };
    };
  };
  home.packages = with pkgs; [
    dmenu
  ];
}
