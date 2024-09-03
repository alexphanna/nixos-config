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
          rev = "0f3607ba53517f0a39bd42efc060835cd84fd528";
          hash = "sha256-lOkL9v+W//ObsWQ9/txe2rE48guWZaEK1FNhPsZSxrg=";
        };
      };
    };
  };
}