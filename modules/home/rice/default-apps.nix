{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # browser
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
      "application/pdf" = "librewolf.desktop";
      "image/jpeg" = "librewolf.desktop";
      "image/png" = "librewolf.desktop";
      "image/gif" = "librewolf.desktop";

      # dev
      "text/plain" = "code.desktop";
      "text/x-shellscript" = "code.desktop";
      "text/x-script.python" = "code.desktop";
      "application/javascript" = "code.desktop";
      "application/json" = "code.desktop";
      "text/x-php" = "code.desktop";

      "application/zip" = "xarchiver.desktop";

      # video
      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
    };
  };
}