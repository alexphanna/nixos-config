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
          rev = "397a669cad9c8185f0b28f410c1526dc5198d5ed";
          hash = "sha256-LH9r6LHjDTU5Ag5vIB8Mu9KSW3Cs74Iad9j6uZknHOk=";
        };
        # src = /home/alex/Documents/dwm;
      };
    };
  };
}
