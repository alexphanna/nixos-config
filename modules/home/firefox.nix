{
  pkgs,
  inputs,
  ...
}:
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
      # BlockAboutConfig = true;
      BlockAboutSupport = true;

      Cookies = {
        Allow = [
          # websites that I use somewhat frequently and don't feel like re logging in every time
          "https://accounts.google.com"
          "https://www.youtube.com"
          "https://www.github.com"
          "https://www.twitch.tv"
          "https://www.reddit.com"

          # school
          "https://psu.edu"
          "https://instructure.com/"
          "https://canvaslms.com/"
          "https://kaltura.com/"
          "https://login.microsoftonline.com"
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
            url = "https://psu.instructure.com/login/saml/";
          }
          {
            name = "LionPATH";
            keyword = "lionpath";
            url = "https://www.lionpath.psu.edu/";
          }
        ];
      };

      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          sponsorblock
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
          "uBlock0@raymondhill.net" = {
            force = true;
            settings = {
              "userSettings" = {
                "uiAccentCustom" = true;
                "uiAccentCustom0" = "#8000FF";
                "externalLists" = "https://raw.githubusercontent.com/laylavish/uBlockOrigin-HUGE-AI-Blocklist/main/list.txt";
                "importedLists" = [
                  "https://raw.githubusercontent.com/laylavish/uBlockOrigin-HUGE-AI-Blocklist/main/list.txt"
                ];
              };
              "user-filters" = ''
                ! Hide Playables section
                www.youtube.com##:matches-path(/^(?!\/feed\/history).*$/)ytd-rich-shelf-renderer:has(#title:has-text(/(^| )Playables( |$)/i))
              '';
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
