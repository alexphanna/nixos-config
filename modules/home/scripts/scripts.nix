{ pkgs, ... }: let
    screenshot = pkgs.writeScriptBin "screenshot" (builtins.readFile ./screenshot.sh);
    screenshotsel = pkgs.writeScriptBin "screenshotsel" (builtins.readFile ./screenshotsel.sh);
    tesseractsel = pkgs.writeScriptBin "tesseractsel" (builtins.readFile ./tesseractsel.sh);
in {
    home.packages = with pkgs; [
        screenshot
        screenshotsel
        tesseractsel
    ];
}