{ pkgs, ... }:
let
  ffmpeg-bitrate-stats = pkgs.python3Packages.callPackage ./../../packages/ffmpeg-bitrate-stats.nix { };
in
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
    jellyfin-ffmpeg # required for "-bsf:v hevc_metadata=remove_dovi=1" argument
    mkvtoolnix
    paprefs
    pavucontrol
    handbrake
    dovi-tool
    mediainfo
    ffmpeg-bitrate-stats

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
    gpauth
    gpclient

    # storage
    gparted
    qdirstat
    gsmartcontrol

    # other
    killall
    openapi-generator-cli
    gucharmap
    wine
    speedtest-cli
    file
  ];
}
