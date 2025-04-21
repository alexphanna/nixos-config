{ inputs, nixpkgs, self, username, host, ...}:
{
  imports =
       [ (import ./user.nix) ]
    ++ [ (import ./boot.nix) ]
    ++ [ (import ./networking.nix) ]
    ++ [ (import ./pipewire.nix) ]
    ++ [ (import ./system.nix) ]
    ++ [ (import ./fonts.nix) ]
    ++ [ (import ./services.nix) ]
    ++ [ (import ./steam.nix) ]
    ++ [ (import ./programs.nix) ]
    ++ [ (import ./xserver.nix) ];
}