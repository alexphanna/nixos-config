{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_22
  ];
  programs.vscode.profiles.default.extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "vscode-react-native";
      publisher = "msjsdiag";
      version = "1.13.0";
      sha256 = "sha256-zryzoO9sb1+Kszwup5EhnN/YDmAPz7TOQW9I/K28Fmg=";
    }
  ];
}
