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
          rev = "19206b8584bc9eb712131cbdf4e97a49a6c05916";
          hash = "sha256-99rriMBjGea2L16Ag1ZHi/b4NRrKwY97/Vf2NtDgNNs=";
        };
      };
    };
  };
}
