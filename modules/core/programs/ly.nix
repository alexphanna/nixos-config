{pkgs, host, ... }:
let
  sway = pkgs.sway.override {
    extraOptions = if (host == "desktop") then [
      "--unsupported-gpu"
    ] else [];
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