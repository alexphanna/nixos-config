{ pkgs, ... }: 
{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      uosc
      thumbfast
      sponsorblock
    ];
    config = {
      # save-position-on-quit = true;
      vo = "gpu";
      hwdec = "auto";
    };
  };
}