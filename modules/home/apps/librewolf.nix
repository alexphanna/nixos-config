{
  pkgs,
  lib,
  accentColor,
  ...
}:
{
  home.packages = [
    (pkgs.writeScriptBin "firefox" "librewolf")
  ];
  programs.librewolf = {
    enable = true;

    policies = {
      Cookies.Allow = [
        # websites that I use somewhat frequently and don't feel like re logging in every time
        # "https://accounts.google.com"
        "https://www.youtube.com"
        "https://www.github.com"

        # school
        "https://psu.edu"
        "https://instructure.com/"
        "https://canvaslms.com/"
        "https://kaltura.com/"
        "https://login.microsoftonline.com"
      ];
      Homepage.StartPage = "none";
      NewTabPage = false;
      PasswordManagerEnabled = false;
      GenerativeAI.Enabled = false;
      DisplayBookmarksToolbar = "never";
      Permissions.Notifications.BlockNewRequests = true;
      SearchSuggestEnabled = true;
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
          bitwarden
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
                {
                  description = "Twitter";
                  exampleUrl = "https://x.com/User";
                  exampleResult = "https://nitter.net/User";
                  includePattern = "https://x.com/*";
                  redirectUrl = "https://nitter.net/$1";
                  patternType = "W";
                  appliesTo = [ "main_frame" ];
                }
              ];
            };
          };
          # https://github.com/search?q=language%3Anix+%22nur.repos.rycee%22+%22uBlock0%40raymondhill.net%22&type=code
          # https://github.com/Rsr45/nixos-config/blob/c398c8caeba5a3ddd02defe0ba23daa433a37962/home/hare/common/optional/browsers/librewolf.nix#L78
          "uBlock0@raymondhill.net" = {
            force = true;
            settings =
              let
                importedLists = [
                  "https://raw.githubusercontent.com/i5heu/ublock-hide-yt-shorts/master/list.txt"
                  "https://raw.githubusercontent.com/i5heu/ublock-hide-yt-shorts/master/playables.txt"
                  "https://raw.githubusercontent.com/Stevoisiak/Stevos-GenAI-Blocklist/refs/heads/main/GenAI-Blocklist.txt"
                ];
              in
              {
                uiAccentCustom = true;
                uiAccentCustom0 = "${accentColor}";
                cloudStorageEnabled = lib.mkForce false;
                advancedUserEnabled = true;
                userFiltersTrusted = true;
                importedLists = importedLists;
                externalLists = lib.concatStringsSep "\n" importedLists;
                selectedFilterLists = [
                  "user-filters"
                  "ublock-filters"
                  "ublock-badware"
                  "ublock-privacy"
                  "ublock-abuse"
                  "ublock-unbreak"
                  "easylist"
                  "easyprivacy"
                  "urlhaus-1"
                  "plowe-0"

                  # annoyances
                  "adguard-popup-overlays"
                  "adguard-mobile-app-banners"
                  "adguard-other-annoyances"
                  "adguard-widgets"
                  "easylist-annoyances"
                  "easylist-chat"
                  "easylist-newsletters"
                  "easylist-notifications"
                  "ublock-annoyances"

                  # cookies
                  "adguard-cookies"
                  "ublock-cookies-adguard"
                  "fanboy-cookiemonster"
                  "ublock-cookies-easylist"
                ]
                ++ importedLists;
              };
          };
        };
      };

      settings = {
        "privacy.resistFingerprinting" = false;
      };

      search = {
        force = true;
        default = "google";
        privateDefault = "google";

        engines = {
          "google" = {
            name = "Google";
            urls = [
              {
                template = "https://www.google.com/search?q={searchTerms}";
              }
            ];
            icon = "https://www.google.com/favicon.ico";
            definedAliases = ["@g"];
          };

          "nix-packages" = {
            name = "Nix Packages";
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "25.11";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          "nix-options" = {
            name = "Nix Options";
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "channel";
                    value = "25.11";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };

          "nixos-wiki" = {
            name = "NixOS Wiki";
            urls = [
              {
                template = "https://wiki.nixos.org/w/index.php";
                params = [
                  {
                    name = "search";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nw" ];
          };

          "nix-github" = {
            name = "Nix GitHub";
            urls = [
              {
                template = "https://github.com/search";
                params = [
                  {
                    name = "type";
                    value = "code";
                  }
                  {
                    name = "q";
                    value = "language%3Anix+{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@ng" ];
          };

          "ddg".metaData.hidden = true;
          "bing".metaData.hidden = true;
          "perplexity".metaData.hidden = true;
          "wikipedia".metaData.hidden = true;
          "policy-DuckDuckGo Lite".metaData.hidden = true;
          "policy-MetaGer".metaData.hidden = true;
          "policy-Mojeek".metaData.hidden = true;
          "policy-Searx Belgium".metaData.hidden = true;
          "policy-Startpage".metaData.hidden = true;
        };
      };
    };
  };
}
