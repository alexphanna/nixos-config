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
          rev = "1fd94cbf7661501681c0a49d21e204f4f0661822";
          hash = "sha256-lOkL9v+W//ObsWQ9/txe2rE48guWZaEK1FNhPsZSxrg=";
        };
      };
    };
  };
}