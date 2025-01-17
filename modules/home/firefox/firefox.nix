{ pkgs, inputs, ... }:
{
  imports = [ inputs.arkenfox.hmModules.default ];

  programs.firefox = {
    enable = true;
    arkenfox = {
      enable = true;
      version = "master";
    };

    policies = {
      Cookies = {
        Allow = [
          "https://accounts.google.com"
          "https://www.youtube.com"
          "https://www.github.com"
          "https://www.twitch.tv"
          "https://www.reddit.com"

          # school
          "https://rutgers.edu"
          "https://instructure.com/"
          "https://duosecurity.com/"
          "https://canvaslms.com/"
        ];
      }; 
    };

    profiles.default = {
      search = {
        force = true;
        default = "Google";
      };

      bookmarks = [
        {
          name = "YouTube";
          keyword = "youtube";
          url = "https://www.youtube.com/";
        }
        {
          name = "GitHub";
          keyword = "github";
          url = "https://www.github.com/";
        }
        {
          name = "Canvas";
          keyword = "canvas";
          url = "https://rutgers.instructure.com/login/saml/";
        }
      ];

      arkenfox = {
        enable = true;
        enableAllSections = true;

        "0900".enable = false; # passwords
        "4500".enable = false; # optional rfp
      };

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "extensions.pocket.enabled" = false;
        "extensions.autoDisableScopes" = 0;
      };

      userContent = ''
        @-moz-document url-prefix("about:") { 
          html, body, window {
            background-color: #565656 !important;
          }
        }
      '';

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        sponsorblock
        grammarly
        return-youtube-dislikes
        # ttv-lol not in repo
      ];
    };
  };
}
