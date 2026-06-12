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
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.unstable.sway;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    extraOptions =
      if (host == "desktop") then
        [
          "--unsupported-gpu"
        ]
      else
        [ ];
    checkConfig = false;
    # for_window    [app_id=\"com.obsproject.Studio\"]    move scratchpad
    extraConfig = ''
      for_window    [title="Picture-in-Picture"]          floating enable, resize set 480, resize set height 270, move position 100 ppt 100 ppt, move left 480, move up 270, sticky enable
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
      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
        in
        lib.mkOptionDefault {
          "XF86AudioRaiseVolume" = "exec 'wpctl set-volume @DEFAULT_SINK@ 5%+'";
          "XF86AudioLowerVolume" = "exec 'wpctl set-volume @DEFAULT_SINK@ 5%-'";
          "XF86AudioMute" = "exec 'wpctl set-mute @DEFAULT_SINK@ toggle'";
          "XF86MonBrightnessUp" = "exec 'xbacklight -inc 5'";
          "XF86MonBrightnessDown" = "exec 'xbacklight -dec 5'";
          "Print" = "exec 'screenshot'";
          "${modifier}+p" =
            "floating enable, resize set 480, resize set height 270, move position 100 ppt 100 ppt, move left 480, move up 270, sticky enable"; # picture-in-picture
          "${modifier}+Shift+e" = "exec 'swaymsg exit'"; # skips exit dialog
        };
      menu = "${pkgs.wmenu}/bin/wmenu-run -i -n FFFFFF -N 000000 -s ${lib.strings.removePrefix "#" accentColor} -S 000000 -m FFFFFF -M 000000 -f \"monospace 16\"";
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
          command = "${pkgs.swaybg}/bin/swaybg -i wallpaper.jpg";
        }
        # https://github.com/obsproject/obs-studio/issues/12650#issuecomment-3396656122
        /*
          {
            command = "rm -r ~/.config/obs-studio/.sentinel";
          }
          {
            command = "obs --startreplaybuffer";
          }
        */
      ];
      output =
        if (host == "desktop") then
          {
            # Monitor
            DP-1 = {
              mode = "1920x1080@74.973Hz";
            };
            # TV
            HDMI-A-1 = {
              power = "off";
            };
          }
        else
          { };
      input = {
        "*" = {
          accel_profile = "flat";
          pointer_accel = if (host == "desktop") then "-0.75" else "0";
        };
      };
    };
  };
  home = {
    packages = with pkgs; [
      wmenu
      swaybg
    ];
    sessionVariables = {
      # somewhat improper way to declare this
      # needs to be this way because of the way auto login does not run extraSessionCommands
      # required for HDR
      # DOES not work with packaged sunshine
      # WLR_RENDERER = "vulkan";
    };
  };
}
