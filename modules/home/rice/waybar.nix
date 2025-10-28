{ lib, host, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        height = 32;
        modules-left = [ "sway/workspaces" ];
        modules-right = (
          if (host == "laptop") 
          then [ "battery#bat0" "battery#bat1" "backlight" ]
          else []
        ) ++ [ 
          "wireplumber#source" 
          "wireplumber" 
          "network" 
          "clock" 
        ];
        wireplumber = {
          format = "<span rise='-4000' size='large'>{icon}</span>";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          format-icons = ""; # [ "" "" ""];
          format-muted = "<span rise='-4000' size='large'></span>";
          max-volume = 200.0;
          tooltip-format = "{volume}%";
        };
        "wireplumber#source" = {
          node-type = "Audio/Source";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          format = "<span rise='-4000' size='large'></span>";
          format-muted = "<span rise='-4000' size='large'></span>";
          max-volume = 200.0;
          tooltip-format = "{volume}%";
        };
        network = {
          format-linked = "<span rise='-4000' size='large'></span>"; # I think this means I have a vpn
          format-ethernet = "<span rise='-4000' size='large'></span>";
          format-wifi = "<span rise='-4000' size='large'>{icon}</span>";
          format-disconnected = "<span rise='-4000' size='large'></span>";
          format-icons = [ "" "" "" ];
          tooltip-format-wifi = "{essid}";
        };
        backlight = {
          device = "intel_backlight";
          format = "<span rise='-4000' size='large'></span>";
          tooltip-format = "{percent}%";
        };
        "battery#bat0" = {
          bat = "BAT0";
          format = "<span rise='-4000' size='large'>{icon}</span>";
          format-charging = "<span rise='-4000' size='large'></span>";
          format-icons = ["" "" "" "" "" "" "" ""];
          tooltip-format = "{capacity}%";
        };
        "battery#bat1" = {
          bat = "BAT1";
          format = "<span rise='-4000' size='large'>{icon}</span>";
          format-charging = "<span rise='-4000' size='large'></span>";
          format-icons = ["" "" "" "" "" "" "" ""];
          tooltip-format = "{capacity}%";
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

      box.module button:hover, #wireplumber:hover, #wireplumber#source:hover, #backlight:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        background: inherit;
        color: #8000FF;
      }

      tooltip {
        background: rgba(32, 32, 32, 0.5);
      }
    '';
  };
}