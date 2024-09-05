{ pkgs, inputs, ... }:
let
  # Fetch the GitHub repository
  cascadeRepo = pkgs.fetchFromGitHub {
    owner = "alexphanna";
    repo = "cascade";
    rev = "fcf25b54cb37d90fe1c0a16eea945f44b8db9bb2";
    sha256 = "6kYtoC/StiC/MbOSYld5JHMJvCoPLv90aZD1GaduUiE=";
  };

  # Derive a package from the repository
  cascadePackage = pkgs.stdenv.mkDerivation {
    name = "cascade";
    src = cascadeRepo;

    installPhase = ''
      mkdir -p $out
      cp -r * $out
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
      version = "128.0";
    };

    profiles.default = {
      search = {
        force = true;
        default = "DuckDuckGo";
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
          url = "https://rutgers.instructure.com";
        }
      ];

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
        "extensions.autoDisableScopes" = 0;
      };

      userChrome = ''
        @import url("cascade/chrome/userChrome.css");
      '';

      userContent = ''
        @-moz-document url-prefix("about:") { 
          html, body, window {
            background-color: #181818 !important;
          }
        }
      '';

      extensions = with pkgs; [
        nur.repos.rycee.firefox-addons.ublock-origin
        nur.repos.rycee.firefox-addons.sponsorblock
        nur.repos.rycee.firefox-addons.languagetool
      ];
    };
  };
}
