{ lib, pkgs, host, config, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    extraOptions = [
      "--unsupported-gpu"
    ];
    checkConfig = false;
    # positions must account for gaps and bar
    /*
      corner_radius 16
      blur enable
      blur_radius 3
      blur_passes 3
      blur_noise 0
      layer_effects "notifications" blur enable; corner_radius 10;
    */
    extraConfig = ''
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
          background = "#202020C0";
          border = "#202020C0";
          childBorder = "#202020C0";
          indicator = "#202020C0";
          text = "#FFFFFF";
        };
        focused = {
          background = "#202020C0";
          border = "#202020C0";
          childBorder = "#202020C0";
          indicator = "#202020C0";
          text = "#FFFFFF";
        };
        focusedInactive = {
          background = "#202020C0";
          border = "#202020C0";
          childBorder = "#202020C0";
          indicator = "#202020C0";
          text = "#FFFFFF";
        };
      };
      fonts.size = 10.0;
      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in lib.mkOptionDefault {
        "XF86AudioRaiseVolume" = "exec 'wpctl set-volume @DEFAULT_SINK@ 5%+'";
        "XF86AudioLowerVolume" = "exec 'wpctl set-volume @DEFAULT_SINK@ 5%-'";
        "XF86AudioMute" = "exec 'wpctl set-mute @DEFAULT_SINK@ toggle'";
        "XF86MonBrightnessUp" = "exec 'xbacklight -inc 5'";
        "XF86MonBrightnessDown" = "exec 'xbacklight -dec 5'";
        "Shift+Print" = "exec 'screenshotsel'";
        "Print" = "exec 'screenshot'";
        "${modifier}+p" = "floating enable, resize set 480, resize set height 270, move position 100 ppt 100 ppt, move left 480, move up 270, sticky enable";
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
        { 
          command = if (host == "desktop")
            then "${pkgs.mpvpaper}/bin/mpvpaper -o '--loop --glsl-shaders=' ALL Cyberpunk_2077_4K_Wallpaper.mp4"
            else "${pkgs.swaybg}/bin/swaybg -i wallpaper.jpg"; 
        }
      ];
      output =
        if (host == "desktop") 
        then {
          # Monitor
          DP-1 = {
            mode = "1920x1080@74.973Hz";
          };
          # TV
          HDMI-A-1 = {
            power = "off";
          };
        }
        else {};
      input = {
        "*" = {
          accel_profile = "flat";
          pointer_accel = "-0.75";
        };
      };
    };
  };
  home = {
    packages = with pkgs; [
      wmenu
      mpvpaper
      swaybg
    ];
  };
}
