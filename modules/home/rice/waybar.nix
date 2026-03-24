{ host, accentColor, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        height = 32;
        modules-left = [ "sway/workspaces" ];
        modules-right = (
          if (host == "laptop") 
          then [ "group/battery#bat0" "group/battery#bat1" "group/brightness" ]
          else []
        ) ++ [ 
          "group/audio-out"
          "bluetooth" 
          "network" 
          "clock" 
        ];

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
          format = "<span rise='-4000' size='large'>{icon}</span>";
          on-click = "pavucontrol";
          format-icons = [ "" "" "" ""];
          format-muted = "<span rise='-4000' size='large'></span>";
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
          format = "<span rise='-4000' size='large'></span>"; 
          format-no-controller = "<span rise='-4000' size='large'></span>";
          tooltip = false;
          on-click = "blueman-manager";
        };

        network = {
          format-linked = "<span rise='-4000' size='large'></span>"; # I think this means I have a vpn
          format-ethernet = "<span rise='-4000' size='large'></span>";
          format-wifi = "<span rise='-4000' size='large'>{icon}</span>";
          format-disconnected = "<span rise='-4000' size='large'></span>";
          format-icons = [ "" "" "" ];
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname}";
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
          format = "<span rise='-4000' size='large'></span>";
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
          format = "<span rise='-4000' size='large'>{icon}</span>";
          format-charging = "<span rise='-4000' size='large'></span>";
          format-icons = ["" "" "" "" "" "" "" ""];
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
          format = "<span rise='-4000' size='large'>{icon}</span>";
          format-charging = "<span rise='-4000' size='large'></span>";
          format-icons = ["" "" "" "" "" "" "" ""];
          tooltip = false;
        };
        "battery#bat1-capacity" = {
          bat = "BAT1";
          format = "{capacity}%";
          tooltip = false;
        };

        clock = {
          format = "{:%m/%d/%y %I:%M %p}";
          tooltip = false;
        };
        "sway/workspaces" = {
          format = "<span rise='-4000' size='large'>{icon}</span>";
          on-click = "activate";
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
          };
          format-icons = {
            focused = "";
            default = "";
          };
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: monospace, Material Symbols Rounded;
        font-size: 16px;
        padding: 0; 
        transition: none;
      }

      window#waybar {
        background: transparent;
        color: #FFFFFF;
      }

      label.module {
        padding: 0 4px;
      }

      #clock {
        padding: 0px 8px 0px 12px;
      }
      
      #workspaces button {
        padding: 0 8px;
      }

      box.module button:hover, #audio-out:hover, #audio-in:hover, #brightness:hover, battery#bat0:hover, battery#bat1:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        background: inherit;
        color: ${accentColor};
      }

      tooltip {
        background: rgba(32, 32, 32, 0.5);
      }
    '';
  };
}