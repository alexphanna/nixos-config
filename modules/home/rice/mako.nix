{
  services.mako = {
    enable = true;
    settings = {
      "actionable=true" = {
        anchor = "top-left";
      };
      actions = true;
      anchor = "top-right";
      background-color = "#20202080";
      border-radius = "8,0,0,8";
      border-size=0;
      default-timeout = 5000;
      font = "monospace 16px";
      height = 100;
      icons = true;
      ignore-timeout = true;
      layer = "top";
      margin = 0;
      outer-margin = "32,0";
      markup = true;
      width = 300;
      padding = 16;
    };
  };

  # wayland.windowManager.sway.extraConfig = ''
  #   layer_effects 'notifications' 'blur enable;
  # '';

  # Inspired by: https://github.com/kira-bruneau/nixos-config/blob/74926b6d37922ada4e6f438f56fe77d64edc1800/home/programs/mako/default.nix
}