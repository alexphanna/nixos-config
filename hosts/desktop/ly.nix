{pkgs, ... }:
let
  sway = pkgs.sway.override {
    extraOptions = [
      "--unsupported-gpu"
    ];
  };
in
{
    services.displayManager = {
        sessionPackages = [ sway ];
        ly = {
          enable = true;
          x11Support = false;
        };
    };
}