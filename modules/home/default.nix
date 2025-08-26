{
  inputs,
  username,
  host,
  ...
}:
{
  imports = [
    (import ./firefox.nix)
  ]
  ++ [ (import ./gtk.nix) ]
  ++ [ (import ./packages.nix) ]
  ++ [ (import ./vscode.nix) ]
  ++ [ (import ./mpv.nix) ]
  ++ [ (import ./mangohud.nix) ]
  ++ [ (import ./dot-files/dot-files.nix) ]
  ++ [ (import ./scripts/scripts.nix) ]
  ++ [ (import ./zsh.nix) ]
  ++ [ (import ./picom.nix) ]
  ++ [ (import ./thunderbird.nix) ]
  ++ [ (import ./services.nix) ]
  ++ [ (import ./discord.nix) ];
}
