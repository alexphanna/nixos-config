{ pkgs, ... }:
let 
  moonlight = pkgs.moonlight-qt.overrideAttrs (oldAttrs: {
    version = "unstable-2026-06-23";
    src = pkgs.fetchFromGitHub {
      owner = "moonlight-stream";
      repo = "moonlight-qt";
      rev = "d997a0d0c878afa9eeaf7c81b5e315f02e52749e";
      hash = "sha256-ZeVucnACnaRP/D4d+GecyCy6A45Dfw1agcbKFgifeUs=";
      fetchSubmodules = true;
    };
    # Remove patches that may not apply to the current rev
    patches = [];
  });
in 
{
  environment.systemPackages = [
    moonlight
  ];
}