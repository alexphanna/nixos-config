{ username, host, ... }:
{
  /*services.getty = {
    autologinUser = "${username}";
    # autologinOnce = true;
  };
  environment.loginShellInit =
    if (host == "desktop") then
      ''
        [[ "$(tty)" == /dev/tty1 ]] && { sway --unsupported-gpu; exec steam-gamescope; }
      ''
    else
      ''
        [[ "$(tty)" == /dev/tty1 ]] && { sway --unsupported-gpu }
      '';*/
}
