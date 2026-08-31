{ host, ... }:
{
  imports =
    if (host == "desktop") then
      [
        ./cpp.nix
        ./dart.nix
        ./game-maker.nix
        ./go.nix
        ./java.nix
        ./javascript.nix
        ./latex.nix
        ./macos.nix
        ./python.nix
        ./nix.nix
        ./vscode.nix
        # ./swift.nix
      ]
    else
      [ ]
      ++ [
        ./nix.nix
        ./vscode.nix
      ];
}
