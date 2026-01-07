{ pkgs, lib, ... }:
{
  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    virt-viewer
  ];

  nixpkgs.overlays = lib.mkAfter [
    (final: prev: {
      usbredir = prev.usbredir.overrideAttrs (previousAttrs: {
        patches = [
          ../../../patches/usbredir-blacklist.patch
        ];
      });
    })
  ];
}
