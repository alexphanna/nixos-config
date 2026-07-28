{
  imports = [
    ./hardware-configuration.nix
    ./intel.nix
    ./jellyfin-forward.nix
    ./moonlight.nix
    ./nix-serve.nix
    ./thinkpad-t480.nix
    ./virtualization.nix
    ./../../modules/core
  ];
}
