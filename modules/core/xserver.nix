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
          rev = "52114012a4ec703eea68c581b8cd3f48596559cc";
          hash = "sha256-wGNdJU/oQBjbTGEqQF3Do/F6n/RgBKtNLAQmxVOPXCc=";
        };
      });
    };
  };
}
