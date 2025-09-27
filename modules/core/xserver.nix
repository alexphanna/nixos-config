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
      package = pkgs.dwm.overrideAttrs (oldAttrs: {
        buildInputs = (oldAttrs.buildInputs or []) ++ [pkgs.xorg.libxcb];
        src = pkgs.fetchFromGitHub {
          owner = "alexphanna";
          repo = "dwm";
          rev = "e4b4315caa0da46637d51f3b08d51610d98bb296";
          hash = "sha256-ah0dD3Rvx1lBn25Ns2ZkoX0uIME0y4fqW1YejK8eQEI=";
        };
      });
    };
  };
}
