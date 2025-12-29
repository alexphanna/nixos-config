{ pkgs, ... }:
{
  services.sunshine = {
    enable = false;
    capSysAdmin = true;
    # Enable nvenc support
    package = pkgs.sunshine.override {
      cudaSupport = true;
    };
  };
}