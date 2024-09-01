{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    discord
    spotify
    gpodder
    obsidian
    (mpv.override {
      scripts = [
        pkgs.mpvScripts.uosc
      ];
    })
    galculator
    (st.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "alexphanna";
        repo = "st";
        rev = "b35c560d0f3c213927760dc51ff49e3bb2073e37";
        hash = "sha256-FAfxQ2hiKF4LM5uFjQLakWSKDPmTTKuKXiJnPsELoOY=";
      };
    }))
    (dmenu.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "alexphanna";
        repo = "dmenu";
        rev = "5ab97d0c8a38e4aed7f9353eb8c573ee5f48be70";
        hash = "sha256-+vRMPhYKb8SSvC3XvNXDLubcviRVIluLwP7uP2U6OO0=";
      };
    }))

    # linux-y stuff
    aria2
    git
    xcompmgr
    feh
    bc
    nodejs
    dconf
    python3
  ];
}