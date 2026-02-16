{ pkgs, ... }:
let
  screenshot = pkgs.writeScriptBin "screenshot" (builtins.readFile ./screenshot.sh);
  screenshotsel = pkgs.writeScriptBin "screenshotsel" (builtins.readFile ./screenshotsel.sh);
  tesseractsel = pkgs.writeScriptBin "tesseractsel" (builtins.readFile ./tesseractsel.sh);
  xbacklight-log = pkgs.writeScriptBin "xbacklight-log" (builtins.readFile ./xbacklight-log.py);
  steamos-session-select = pkgs.writeScriptBin "steamos-session-select" (builtins.readFile ./steamos-session-select.sh);
in
{
  home.packages = [
    screenshot
    screenshotsel
    tesseractsel
    xbacklight-log
    steamos-session-select

    # dependencies
    pkgs.tesseract
    pkgs.slurp
    pkgs.grim
    pkgs.wl-clipboard
  ];
}
