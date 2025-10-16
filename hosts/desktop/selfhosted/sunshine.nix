{ pkgs, ... }:
{
  services.sunshine = {
    enable = false;
    # Enable nvenc support
    package = pkgs.sunshine.override {
      cudaSupport = true;
    };
  };
}