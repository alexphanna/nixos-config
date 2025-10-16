{ username, ... }:
{
    services.getty = {
        autologinUser = "${username}";
        autologinOnce = true;
    };
    environment.loginShellInit = ''
        [[ "$(tty)" == /dev/tty1 ]] && sway --unsupported-gpu
    '';
}