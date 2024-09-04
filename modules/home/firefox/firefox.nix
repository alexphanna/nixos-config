{ pkgs, inputs, ... }:
{
  imports = [ inputs.arkenfox.hmModules.default ];
  programs.firefox = {
    enable = true;
    arkenfox = {
      enable = true;
      version = "128.0";
    };

    profiles."Alex" = {
      name = "Alex";
      id = 0;
      isDefault = true;

      search = {
        force = true;
        default = "DuckDuckGo";
      };

      arkenfox = {
        enable = true;
        enableAllSections = true;

        "0900".enable = false; # passwords
        "2800".enable = false; # shutdown & sanitizing
        "4500".enable = false; # optional rfp
      };

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "extensions.pocket.enabled" = false;
      };

      userChrome = ''
        @import "/home/alex/Documents/nixos-config/modules/home/firefox/chrome/userChrome.css";
      '';

      userContent = ''
        @-moz-document url-prefix("about:") { 
          html, body, window {
            --newtab-background-color: #181818 !important;	
            --in-content-page-background: #181818 !important;
            --in-content-box-background: #181818 !important; 
            --bg-color: #181818 !important;
          }
        }
      '';

      extensions = with pkgs; [
        nur.repos.rycee.firefox-addons.ublock-origin
        nur.repos.rycee.firefox-addons.sponsorblock
      ];
    };
  };
}
