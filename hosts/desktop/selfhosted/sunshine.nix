{ pkgs, ... }:
{
  services.sunshine = {
    enable = true;
    # Enable nvenc support
    package = pkgs.sunshine.override {
      cudaSupport = true;
    };
  };
}