{ pkgs, inputs, ... }:
let
  # Fetch the GitHub repository
  cascadeRepo = pkgs.fetchFromGitHub {
    owner = "alexphanna";
    repo = "cascade";
    rev = "95d9b16767f198e282aedeecceae27e3f77316f5";
    sha256 = "+A5LvuMmyBVFtigkeyFMdQ6hLqv+OKIbikmxl1GstWo=";
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
      version = "master";
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
        "2800".enable = false; # shutdown & sanitizing
        "4500".enable = false; # optional rfp
      };

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "extensions.pocket.enabled" = false;
        "extensions.autoDisableScopes" = 0;
        "full-screen-api.ignore-widgets" = true;
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
        nur.repos.rycee.firefox-addons.grammarly
      ];
    };
  };
}
