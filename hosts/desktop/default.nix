{
  imports = [
    ./hardware-configuration.nix
    ./selfhosted/audiobookshelf.nix
    ./selfhosted/jellyfin.nix
    ./selfhosted/sunshine.nix
    ./selfhosted/vscode-server.nix
    ./autologin.nix
    ./nvidia.nix
    ./virtualization.nix
    ./wake-on-lan.nix
    ./../../modules/core
  ];
}
