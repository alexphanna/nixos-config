{ pkgs, ... }:
{
  home.packages = with pkgs.unstable; [
    swift
    swiftPackages.swift-foundation
  ];
  programs.vscode.profiles.default.extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "swift-vscode";
      publisher = "swiftlang";
      version = "2.17.20260923";
      sha256 = "sha256-PWxXiyQfmNF1V6QBwesLXYVvrtvY6G85WDY7S0kHm8k=";
    }
    {
      name = "lldb-dap";
      publisher = "llvm-vs-code-extensions";
      version = "0.7.20261012";
      sha256 = "sha256-bIwUxmHzF0AWdw5bS/L7ZgW8jw//zqgpw25f9R2hiYc=";
    }
  ];
}
