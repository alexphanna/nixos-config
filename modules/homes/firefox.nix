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

        "browser.toolbars.bookmarks.visibility" = "never";
      };

      /*extensions = with pkgs; [
        nur.repos.rycee.firefox-addons.ublock-origin
        nur.repos.rycee.firefox-addons.sponsorblock
      ];*/
    };
  };
}
