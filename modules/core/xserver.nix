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
          rev = "9664025a78ff247cb0064d723cb139fdf84f715c";
          hash = "sha256-B0Zyg+bEIHzBRJCbwgGnpnu0+RiD6K7tXAPfyCb+UKg=";
        };
        # src = /home/alex/Documents/dwm;
      };
    };
  };
}
