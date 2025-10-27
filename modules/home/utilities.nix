{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # compression
    p7zip
    unrar
    unzip
    zip
    xarchiver

    # system information
    fastfetch
    neofetch

    # audio and video
    ffmpeg
    mkvtoolnix
    paprefs
    pavucontrol

    # downloading
    aria2
    git
    nicotine-plus
    qbittorrent
    streamlink # twitch
    yt-dlp

    # network
    angryipscanner

    # storage
    gparted
    qdirstat

    # other
    killall
  ];
}
