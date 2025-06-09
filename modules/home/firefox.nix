{ pkgs, pkgs-unstable, inputs, ... }:
{
  imports = [ inputs.arkenfox.hmModules.default ];

  programs.firefox = {
    enable = true;

    policies = {
      AppAutoUpdate = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      BackgroundAppUpdate = false;

      BlockAboutAddons = true;
      BlockAboutProfiles = true;
      BlockAboutConfig = true;
      BlockAboutSupport = true;

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

      DisableAccounts = true;
      DisableAppUpdate = true;
      DisableDefaultBrowserAgent = true;
      DisableEncryptedClientHello = true;
      DisableFeedbackCommands = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableFirefoxStudies = true;
      DisableForgetButton = true;
      DisableFormHistory = true;
      DisableMasterPasswordCreation = true;
      DisablePasswordReveal = true;
      DisablePocket = true;
      DisablePrivateBrowsing = true;
      DisableProfileImport = true;
      DisableProfileRefresh = true;
      DisableSafeMode = true;
      DisableSetDesktopBackground = true;
      DisableSystemAddonUpdate = true;
      DisableTelemetry = true;
      
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "never";
      DontCheckDefaultBrowser = true;
      DownloadDirectory = "~/Downloads";
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
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
                {
                  description = "Minecraft Wiki";
                  exampleUrl = "https://minecraft.fandom.com/wiki/Brick";
                  exampleResult = "https://minecraft.wiki/w/Bricks";
                  includePattern = "https://minecraft.fandom.com/wiki/*";
                  redirectUrl = "https://minecraft.wiki/w/$1";
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
