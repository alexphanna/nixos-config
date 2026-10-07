{ pkgs, ... }:
{
  services = {
    xserver.enable = true;
    displayManager = {
      defaultSession = "sway";
      sddm = {
        enable = true;
        wayland.enable = false; # cursor doesn't appear enabled
        extraPackages = with pkgs; [
          kdePackages.plasma-desktop
        ];
        theme = "${pkgs.kdePackages.plasma-desktop}/share/sddm/themes/breeze";
      };
    };
  };

  /*
  # https://wiki.archlinux.org/title/SDDM#Passwordless_login
  security.pam.services.sddm.text = ''
    auth        sufficient  pam_succeed_if.so user ingroup nopasswdlogin
    auth        include     system-login
  '';
  users.groups.nopasswdlogin.members = [ username ];
  */
}