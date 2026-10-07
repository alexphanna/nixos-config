{ pkgs, lib, ... }:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 600;
        command = "${pkgs.sway}/bin/swaymsg 'output * power off'";
        resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * power on'";
      }
    ];
  };

  # prevent idle while gaming with controller
  # source: https://github.com/swaywm/swayidle/issues/68#issuecomment-670779101
  wayland.windowManager.sway.extraConfig = lib.mkAfter  ''
    for_window [class="steam_app*"] inhibit_idle focus
  '';
  

  xdg.configFile."xdg-desktop-portal/sway-portals.conf".text = ''
    [preferred]
    default=gtk

    org.freedesktop.impl.portal.ScreenCast=wlr
    org.freedesktop.impl.portal.Screenshot=wlr

    org.freedesktop.impl.portal.Inhibit=none
  '';
}