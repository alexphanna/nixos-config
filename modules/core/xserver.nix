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
          rev = "69cd3e71cf12f06fec913631d6281f1bca18c549";
          hash = "sha256-lOkL9v+W//ObsWQ9/txe2rE48guWZaEK1FNhPsZSxrg=";
        };
      };
    };
  };
}