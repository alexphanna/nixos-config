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
        # ./swift.nix
      ]
    else
      [ ]
      ++ [
        ./nix.nix
        ./vscode.nix
      ];
}
