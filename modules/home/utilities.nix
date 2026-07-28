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

    # audio and video
    ffmpeg
    mkvtoolnix
    paprefs
    pavucontrol
    handbrake
    dovi-tool
    mediainfo

    # downloading
    aria2
    git
    nicotine-plus
    qbittorrent
    streamlink # twitch
    yt-dlp

    # network
    angryipscanner
    linssid

    # storage
    gparted
    qdirstat

    # other
    killall
    openapi-generator-cli
    gucharmap
    wine
    speedtest-cli
  ];
}
