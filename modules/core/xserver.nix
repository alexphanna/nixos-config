{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;

    xkb = {
      layout = "us";
      variant = "";
    };

    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = pkgs.fetchFromGitHub {
          owner = "alexphanna";
          repo = "dwm";
          rev = "661606269e20d0a8d6423923d746f09b43bf998f";
          hash = "sha256-7JgR4xv4AbvRC+6vPnhgLHyDYKLdTHGL0ySVjKI70TQ=";
        };
        # src = /home/alex/Documents/dwm;
      };
    };
  };
}
