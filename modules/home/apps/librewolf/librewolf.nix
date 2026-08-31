{
  pkgs,
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
      DisplayMenuBar = "never";
      Permissions.Notifications.BlockNewRequests = true;
      SearchSuggestEnabled = true;
      DisableFirefoxScreenshots = true;
      TranslateEnabled = false; # replaced with TWP extension
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
          sponsorblock
          return-youtube-dislikes
          adaptive-tab-bar-colour
          bitwarden
          translate-web-pages
        ];
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
            definedAliases = [ "@g" ];
          };

          "nix-packages" = {
            name = "Nix Packages";
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "26.05";
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
                    value = "26.05";
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
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark"; # Required for Firefox auto dark theme in wayland
}
