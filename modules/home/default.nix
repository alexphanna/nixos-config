{ inputs, username, host, ... }:
{
  imports =
       [(import ./firefox/firefox.nix)]
    ++ [(import ./gtk.nix)]
    ++ [(import ./packages.nix)]
    ++ [(import ./vscode.nix)]
    ++ [(import ./dot-files/dot-files.nix)]
    ++ [(import ./scripts/scripts.nix)]
    ++ [(import ./zsh.nix)];
}