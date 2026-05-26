{
  pkgs,
  lib,
  accentColor,
  ...
}:
{
  programs.librewolf.profiles.default.extensions = {
    force = true;
    packages = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
    ];
    settings = {
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
}
