{ pkgs, inputs, username, host, lib, ...}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = [ ./../home/default.nix ];
      home.username = "${username}";
      home.homeDirectory = lib.mkForce "/home/${username}";
      home.stateVersion = "24.11";
      /*xdg.mimeApps = {
        enable = false;
        defaultApplications = {
          "inode/directory" = "thunar.desktop";
          "x-scheme-handler/http" = "firefox.desktop";
          "x-scheme-handler/https" = "firefox.desktop";
          "x-scheme-handler/chrome" = "firefox.desktop";
          "text/html" = "firefox.desktop";
          "application/x-extension-htm" = "firefox.desktop";
          "application/x-extension-html" = "firefox.desktop";
          "application/x-extension-shtml" = "firefox.desktop";
          "application/xhtml+xml" = "firefox.desktop";
          "application/x-extension-xhtml" = "firefox.desktop";
          "application/x-extension-xht" = "firefox.desktop";
        };
      };*/
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}
