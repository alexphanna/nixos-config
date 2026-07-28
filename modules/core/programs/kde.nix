{ username, pkgs, host, ... }:
{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager = {
      plasma-login-manager.enable = true;
      autoLogin = {
        enable = if (host == "desktop") then true else false ;
        user = username;
      };
    };
  };
  security = {
    # If enabled, pam_wallet will attempt to automatically unlock the user’s default KDE wallet upon login.
    # If the user has no wallet named “kdewallet”, or the login password does not match their wallet password,
    # KDE will prompt separately after login.
    pam = {
      services = {
        ${username} = {
          kwallet = {
            enable = true;
            package = pkgs.kdePackages.kwallet-pam;
          };
        };
      };
    };
  };
}