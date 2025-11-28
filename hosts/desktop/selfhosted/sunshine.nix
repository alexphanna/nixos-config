{ pkgs, ... }:
{
  services.sunshine = {
    enable = true;
    capSysAdmin = true;
    # Enable nvenc support
    package = pkgs.sunshine.override {
      cudaSupport = true;
    };
  };
}