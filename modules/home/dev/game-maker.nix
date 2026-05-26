{ pkgs, ... }:
{
  programs.vscode.profiles.default.extensions =
    pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "gml-support";
        publisher = "liaronce";
        version = "1.7.4";
        sha256 = "sha256-eWBERwmulZ8KO/SpMjusX6WNZpU6ikwSwDsVsxvU8z0=";
      }
    ]
    ++ [
      pkgs.vscode-extensions.vscode-icons-team.vscode-icons
    ];
}
