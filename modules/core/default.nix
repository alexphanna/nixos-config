{ inputs, nixpkgs, self, username, host, ...}:
{
  imports =
       [ (import ./user.nix) ]
    ++ [ (import ./virtualization.nix) ]
    ++ [ (import ./boot.nix) ]
    ++ [ (import ./networking.nix) ]
    ++ [ (import ./pipewire.nix) ]
    ++ [ (import ./programs.nix) ]
    ++ [ (import ./system.nix) ]
    ++ [ (import ./xserver.nix) ];
}