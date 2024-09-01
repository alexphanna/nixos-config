{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    profiles."Alex" = {
      name = "Alex";
      id = 0;
      isDefault = true;

      settings = {
        "extensions.pocket.enabled" = false;
        "services.sync.enabled" = false;
        "extensions.autoDisableScopes" = 0;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "identity.fxaccounts.toolbar.defaultVisible" = false;
        "browser.startup.homepage" = "about:blank";
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.display.background_color.dark" = "#181818";
      };

      userChrome = ''
        @import "/home/alex/Documents/nix-config/modules/home/firefox/chrome/userChrome.css";
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
