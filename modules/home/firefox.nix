{ pkgs, pkgs-unstable, inputs, ... }:
{
  imports = [ inputs.arkenfox.hmModules.default ];

  programs.firefox = {
    enable = true;
    arkenfox = {
      enable = true;
      version = "master";
    };

    policies = {
      BlockAboutConfig = true;
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
          "https://gradescope.com/"
          "https://piazza.com/"
        ];
      }; 
    };

    profiles.default = {
      id = 0;
      name = "Default";
      isDefault = true;
      
      bookmarks = {
        force = true;
        settings = [
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
      };

      arkenfox = {
        enable = true;
        enableAllSections = true;

        "0900".enable = false; # passwords
        "4500".enable = false; # optional rfp
      };

      settings = {
        "extensions.pocket.enabled" = false;
        "extensions.autoDisableScopes" = 0;
        "ui.key.menuAccessKeyFocuses" = false; # no alt key
        "media.videocontrols.picture-in-picture.enabled" = true;
      };

      extensions  = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          sponsorblock
          grammarly
          return-youtube-dislikes
          adaptive-tab-bar-colour
          redirector
        ];
        settings = {
          "redirector@einaregilsson.com" = {
            force = true;
            settings = {
              redirects = [
                {
                  description = "NixOS Official Wiki";
                  exampleUrl = "https://nixos.wiki/wiki/Firefox";
                  exampleResult = "https://wiki.nixos.org/wiki/Firefox";
                  includePattern = "https://nixos.wiki/wiki/*";
                  redirectUrl = "https://wiki.nixos.org/wiki/$1";
                  patternType = "W";
                  appliesTo = [ "main_frame" ];
                }
              ];
            };
          };
        };
      };

      search = {
        force = true;
        default = "google";
        privateDefault = "google";
      };
    };
  };
}
