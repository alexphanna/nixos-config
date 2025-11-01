{ pkgs, ... }:
{
  home.packages = with pkgs; [
    swift
  ];
  programs.vscode.profiles.default.extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "swift-vscode";
      publisher = "swiftlang";
      version = "2.12.0";
      sha256 = "sha256-mBxbdHcM6d8NV77oyUv2Ej+yK7rTBQeLrvePFLpgcDE=";
    }
    {
      name = "lldb-dap";
      publisher = "llvm-vs-code-extensions";
      version = "0.3.20251030";
      sha256 = "sha256-MnUk/fd6v0w35ODAJDCDmzEM3gxfauq/itHNOZ5/3qM=";
    }
  ];
}
