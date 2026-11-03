{ host, accentColor, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        height = 32;
        spacing = 0;
        modules-left = [ "sway/workspaces" ];
        modules-right =
          (
            if (host == "laptop") then
              [
                "group/battery#bat0"
                "group/battery#bat1"
                "group/brightness"
              ]
            else
              [ 
                "custom/tv"
              ]
          )
          ++ [
            "group/audio-out"
            "bluetooth"
            "network"
            "custom/clock"
          ];

        "custom/clock" = {
          exec = "date +\"%-m/%-d/%-y %-I:%M %p\"";
          interval = 1;
          tooltip = false;
        };

        "group/audio-out" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 100;
          };
          modules = [
            "wireplumber#icon"
            "wireplumber#volume"
          ];
        };
        "wireplumber#icon" = {
          format = "{icon}";
          on-click = "pavucontrol";
          format-icons = [
            ""
            ""
            ""
            ""
          ];
          format-muted = "";
          max-volume = 200.0;
          scroll-step = 5;
          tooltip = false;
        };
        "wireplumber#volume" = {
          format = "{volume}%";
          on-click = "pavucontrol";
          max-volume = 200.0;
          scroll-step = 5;
          tooltip = false;
        };

        bluetooth = {
          format = "";
          format-no-controller = "";
          tooltip = false;
          on-click = "blueman-manager";
        };

        network = {
          format-linked = ""; # I think this means I have a vpn
          format-ethernet = "";
          format-wifi = "{icon}";
          format-disconnected = "";
          format-icons = [
            ""
            ""
            ""
          ];
          on-click = "nm-connection-editor";
          tooltip = false;
        };

        "group/brightness" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 100;
          };
          modules = [
            "backlight#icon"
            "backlight#brightness"
          ];
        };
        "backlight#icon" = {
          device = "intel_backlight";
          format = "";
          tooltip = false;
        };
        "backlight#brightness" = {
          device = "intel_backlight";
          format = "{percent}%";
          tooltip = false;
        };

        "group/battery#bat0" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 100;
          };
          modules = [
            "battery#bat0-icon"
            "battery#bat0-capacity"
          ];
        };
        "battery#bat0-icon" = {
          bat = "BAT0";
          format = "{icon}";
          format-charging = "";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip = false;
        };
        "battery#bat0-capacity" = {
          bat = "BAT0";
          format = "{capacity}%";
          tooltip = false;
        };

        "group/battery#bat1" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 100;
          };
          modules = [
            "battery#bat1-icon"
            "battery#bat1-capacity"
          ];
        };
        "battery#bat1-icon" = {
          bat = "BAT1";
          format = "{icon}";
          format-charging = "";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip = false;
        };
        "battery#bat1-capacity" = {
          bat = "BAT1";
          format = "{capacity}%";
          tooltip = false;
        };
        "sway/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
          };
          format-icons = {
            focused = "";
            default = "";
          };
        };

        "custom/tv" = {
          exec = "swaymsg -t get_outputs -r | jq -r 'if any(.[]; .make == \"BBY\" and .model == \"INSIGNIA-TV\" and .serial == \"0x01010101\") then \"\" else \"\" end'";
          interval = 2;
          return-type = "text";
          tooltip = false;
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: monospace, Material Symbols Sharp;
        font-size: 16px;
        padding: 0; 
        margin: 0;
        transition: none;
      }

      window#waybar {
        background: transparent;
        color: #FFFFFF;
      }

      label.module {
        padding: 0 4px;
      }

      #custom-clock {
        padding: 0px 8px 0px 12px;
      }

      #workspaces, #workspaces button {
        padding: 0px 4px;
      }

      box.module button:hover, #audio-out:hover, #audio-in:hover, #brightness:hover, battery#bat0:hover, battery#bat1:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        background: inherit;
        color: ${accentColor};
      }
    '';
  };
}
