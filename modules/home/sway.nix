{ lib, pkgs, ... }: 
let
  wallpaper = pkgs.fetchurl {
    url = "https://unsplash.com/photos/A7MKPs--P3g/download?ixid=M3wxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNzYwNDc2Njc1fA";
    sha256 = "sha256-91e1ZRkX3PmJVqzSTNLBH6e+DIngs+wq/GAq931IXK8=";
  };
in
{
   wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    extraOptions = [
      "--unsupported-gpu"
    ];
    checkConfig = false; 
    extraConfig = ''
      corner_radius 16

      blur enable
      blur_radius 3
      blur_passes 3
      blur_noise 0
      layer_effects "waybar" blur enable;

      for_window    [app_id="mpv"]                             floating enable, resize set 480, resize set height 270, move position 100 ppt 100 ppt, move left 480, move up 270, sticky enable
      for_window    [title="Picture-in-Picture"]               floating enable, resize set 480, resize set height 270, move position 100 ppt 100 ppt, move left 480, move up 270, sticky enable
    '';
    config = {
      defaultWorkspace = "workspace number 1";
      modifier = "Mod4";
      terminal = "foot"; 
      bars = [
        {
          command = "waybar";
        }
      ];
      colors = {
        unfocused = {
          background = "#80808080";
          border = "#80808080";
          childBorder = "#80808080";
          indicator = "#00000080";
          text = "#FFFFFF";
        };
        focused = {
          background = "#00000080";
          border = "#00000080";
          childBorder = "#00000080";
          indicator = "#00000080";
          text = "#FFFFFF";
        };
        focusedInactive = {
          background = "#00000080";
          border = "#00000080";
          childBorder = "#00000080";
          indicator = "#00000080";
          text = "#FFFFFF";
        };
      };
      fonts.size = 10.0;
      keybindings = lib.mkOptionDefault {
        "XF86AudioRaiseVolume" = "exec 'wpctl set-volume @DEFAULT_SINK@ 5%+'";
        "XF86AudioLowerVolume" = "exec 'wpctl set-volume @DEFAULT_SINK@ 5%-'";
        "XF86AudioMute" = "exec 'wpctl set-mute @DEFAULT_SINK@ toggle'";
      };
      menu = "${pkgs.wmenu}/bin/wmenu-run -n 808080 -N 000000 -s FFFFFF -S 000000 -m C0C0C0 -f \"monospace 18\"";
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
      startup = [
        {command = "${pkgs.swaybg}/bin/swaybg -i ${wallpaper}";}
      ];
    };
  };
}
