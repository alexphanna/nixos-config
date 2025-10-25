{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        height = 32;
        modules-left = [ "sway/workspaces" ];
        modules-right = [ "wireplumber#source" "wireplumber" "network" "clock" ];
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
          format-ethernet = "<span rise='-4000' size='large'></span>";
          format-wifi = "<span rise='-4000' size='large'></span>";
          format-disconnected = "<span rise='-4000' size='large'></span>";
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

      box.module button:hover, #wireplumber:hover, #wireplumber#source:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        background: inherit;
        color: #8000FF;
      }
    '';
  };
}