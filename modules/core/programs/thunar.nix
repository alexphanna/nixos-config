{ pkgs, lib, ... }:
{
  programs = {
    xfconf.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
        thunar-media-tags-plugin
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    zstd
  ];

  nixpkgs.overlays = lib.mkAfter [
    (self: super: {
      xarchiver = super.xarchiver.overrideAttrs (old: {
        postInstall = ''
          rm -rf $out/libexec
        '';
      });

      xfce = super.xfce.overrideScope (
        xself: xsuper: {
          thunar-archive-plugin = xsuper.thunar-archive-plugin.overrideAttrs (old: {
            postInstall = ''
              cp ${super.xarchiver}/libexec/thunar-archive-plugin/* $out/libexec/thunar-archive-plugin/
            '';
          });
        }
      );
    })
  ];
}
