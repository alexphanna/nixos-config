{ inputs, username, host, ... }:
{
  imports =
       [(import ./firefox.nix)]
    ++ [(import ./gtk.nix)]
    ++ [(import ./packages.nix)]
    ++ [(import ./steam.nix)]
    #++ [(import ./thunar.nix)]
    ++ [(import ./vscode.nix)]
    ++ [(import ./zsh.nix)];
}
