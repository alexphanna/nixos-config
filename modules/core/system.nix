{
  pkgs,
  config,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  # is not launching with scripts
  system.activationScripts."mpv-link" = {
    text = ''
      ln -sf ${config.home-manager.users.alex.programs.mpv.finalPackage}/bin/mpv /usr/bin/mpv
    '';
  };

  time.timeZone = "America/New_York";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
      flake-registry = "";
      download-buffer-size = 524288000;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
  system.stateVersion = "24.11";
}
