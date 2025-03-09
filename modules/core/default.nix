{ inputs, nixpkgs, self, username, host, ...}:
{
  imports =
       [ (import ./user.nix) ]
    ++ [ (import ./virtualization.nix) ]
    ++ [ (import ./boot.nix) ]
    ++ [ (import ./networking.nix) ]
    ++ [ (import ./pipewire.nix) ]
    ++ [ (import ./system.nix) ]
    ++ [ (import ./fonts.nix) ]
    ++ [ (import ./services.nix) ]
    ++ [ (import ./programs.nix) ]
    ++ [ (import ./jellyfin.nix) ]
    ++ [ (import ./xserver.nix) ];
}