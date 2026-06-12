{ pkgs, ... }:
let
  alsa-ucm-conf-dualsense-haptics =
    with pkgs;
    alsa-ucm-conf.overrideAttrs {

      # https://github.com/alsa-project/alsa-ucm-conf/issues/677#issuecomment-3755019801
      patches = [
        ./../../patches/alsa-ucm-dualsense-haptics.patch
      ];
      version = "1.2.15.3";
      src = fetchurl {
        url = "mirror://alsa/lib/alsa-ucm-conf-1.2.15.3.tar.bz2";
        hash = "sha256-n3noE8CPyGz6Rt11xPzaGkpRtILbJgfh/PqvuS9YijE=";
      };
    };
in
{
  environment.sessionVariables.ALSA_CONFIG_UCM2 = "${alsa-ucm-conf-dualsense-haptics}/share/alsa/ucm2";
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
