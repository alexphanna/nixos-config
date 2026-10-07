{ pkgs, username, ... }:
{
  services.jellyfin = {
    enable = true;
    package = pkgs.unstable.jellyfin;
    user = username;
  };
}
