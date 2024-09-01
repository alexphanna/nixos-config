{ inputs, username, host, ... }:
{
  imports =
       [(import ./firefox/firefox.nix)]
    ++ [(import ./gtk.nix)]
    ++ [(import ./packages.nix)]
    ++ [(import ./vscode.nix)]
    ++ [(import ./zsh.nix)];
}
