{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
      settings.screencast = {
        chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
        chooser_type = "simple";
      };
    };
  };
}