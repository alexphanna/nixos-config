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
          rev = "d199064ac2cf69f5c0a142fda5fd4ac2d34940d6";
          hash = "sha256-V4R0uL/8ml27hvXgXn+ka5RdRQ0JiuZCqDEfVa10Bw0=";
        };
      };
    };
  };
}
