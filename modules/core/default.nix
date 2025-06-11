{ inputs, nixpkgs, self, username, host, ...}:
{
  imports =
       [ (import ./programs/obs.nix) ]
    ++ [ (import ./programs/steam.nix) ]
    ++ [ (import ./programs/thunar.nix) ]
    ++ [ (import ./programs/zsh.nix) ]
    ++ [ (import ./user.nix) ]
    ++ [ (import ./boot.nix) ]
    ++ [ (import ./networking.nix) ]
    ++ [ (import ./pipewire.nix) ]
    ++ [ (import ./system.nix) ]
    ++ [ (import ./fonts.nix) ]
    ++ [ (import ./libinput.nix) ]
    ++ [ (import ./services.nix) ]
    ++ [ (import ./xserver.nix) ];
}