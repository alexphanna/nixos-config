{ config, ... }:
let
  nvidia = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    version = "620.70.06";
    sha256_64bit = "sha256-KRGOOr0IwHVZvMo9nHYjjQOUkK8DYqLlvPy+cgSv1LE=";
    openSha256 = "sha256-dV8vzniUl3UJoG2Q3KdoUJigLRuQeTniUfB670gb1Mw=";
    settingsSha256 = "sha256-CFBRmXFJ9eAf5BRlHMBolahz1Pshr9giI7zcZC29oZ8=";
    persistencedSha256 = "sha256-FpGzhArrvR1nEt8lKDzNEnbvHvGP36gL1dINvpDAkpA=";
  };
in
{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    # fix 4K HDR gamescope flickering issue
    # source: https://github.com/NVIDIA/open-gpu-kernel-modules/pull/1305
    # reference: https://github.com/AddG0/nix-config/commit/b5bbf80c07c5fcdd39fb6915e2251a2c48741228
    package = nvidia // {
      open = nvidia.open.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [ ./../../patches/nvidia-pma-noncontig.patch ];
      });
    };
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
  };
  # Also required to fix 4K HDR gamescope flickering issue
  boot.extraModprobeConfig = "options nvidia NVreg_RegistryDwords=RMDisableNoncontigAlloc=1";
}
