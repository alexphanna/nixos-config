{ lib, pkgs, ... }: 
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

      layer_effects "notifications" blur enable; corner_radius 10;

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
          background = "#20202080";
          border = "#20202080";
          childBorder = "#20202080";
          indicator = "#20202080";
          text = "#FFFFFF";
        };
        focused = {
          background = "#20202080";
          border = "#20202080";
          childBorder = "#20202080";
          indicator = "#20202080";
          text = "#FFFFFF";
        };
        focusedInactive = {
          background = "#20202080";
          border = "#20202080";
          childBorder = "#20202080";
          indicator = "#20202080";
          text = "#FFFFFF";
        };
      };
      fonts.size = 10.0;
      keybindings = lib.mkOptionDefault {
        "XF86AudioRaiseVolume" = "exec 'wpctl set-volume @DEFAULT_SINK@ 5%+'";
        "XF86AudioLowerVolume" = "exec 'wpctl set-volume @DEFAULT_SINK@ 5%-'";
        "XF86AudioMute" = "exec 'wpctl set-mute @DEFAULT_SINK@ toggle'";
        "Shift+Print" = "exec 'screenshotsel'";
        "Print" = "exec 'screenshot'";
      };
      menu = "${pkgs.wmenu}/bin/wmenu-run -n FFFFFF -N 000000 -s 8000FF -S 000000 -m FFFFFF -M 000000 -f \"monospace 18\"";
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
        {command = "${pkgs.mpvpaper}/bin/mpvpaper -o '--loop' ALL Cyberpunk_2077_4K_Wallpaper.mp4";}
      ];
    };
  };
}
