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
          rev = "7ef75a067cadff08725110f33b9e30007e976922";
          hash = "sha256-gSIXjpyHSSUjsIVqa92L1YcnJz5aTKkNYYmkISkmLQk=";
        };
      };
    };
  };
}
