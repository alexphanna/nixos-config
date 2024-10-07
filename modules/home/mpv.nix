{ pkgs, ... }: 
{
  programs.mpv = {
    enable = true;
    scripts = [
      pkgs.mpvScripts.uosc
      pkgs.mpvScripts.thumbfast
      pkgs.mpvScripts.sponsorblock
    ];
    config = {
      save-position-on-quit = true;
      
    };
  };
}