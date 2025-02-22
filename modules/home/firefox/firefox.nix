{ pkgs, inputs, ... }:
let
  # Fetch the GitHub repository
  cascadeRepo = pkgs.fetchFromGitHub {
    owner = "alexphanna";
    repo = "cascade";
    rev = "c247468156ae49a395880ef3c5e2faad4544ce7f";
    sha256 = "sha256-n3G1iLWZFk3T8oX8DuKzlzHND5wXphgtAso141wvgVQ=";
  };

  # Derive a package from the repository
  cascadePackage = pkgs.stdenv.mkDerivation {
    name = "cascade";
    src = cascadeRepo;

    installPhase = ''
      mkdir -p $out
      cp -r * $out
      rm $out/chrome/includes/cascade-colours.css
    '';
  };


  # Path to the desired file in the repository
  cascadeFilePath = "${cascadePackage}";  # Update with actual path in repo
in
{
  imports = [ inputs.arkenfox.hmModules.default ];

  home.file."cascade" = {
    target = ".mozilla/firefox/default/chrome/cascade";
    source = cascadeFilePath;
  };

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

      userChrome = ''
        @import url("cascade/chrome/userChrome.css");
      '';

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        sponsorblock
        grammarly
        return-youtube-dislikes
        adaptive-tab-bar-colour
        # ttv-lol not in repo
      ];
    };
  };
}
