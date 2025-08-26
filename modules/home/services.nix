{ pkgs, username, ... }:
{
  services.syncthing = {
    enable = true;
    settings = {
      urAccepted = -1;
      user = "${username}";
      configDir = "/home/myusername/.config/syncthing";
      gui = {
        user = "${username}";
        password = "";
      };
      devices = {
        "iPhone" = {
          id = "4XMJ7NX-VJXEAXJ-JW3XLVE-LKYC4YC-QK2EX4S-D3ZVV3J-SON6CR6-PKV7IAD";
        };
      };
      folders = {
        "Vault" = {
          path = "/home/${username}/Documents/vault";
          devices = [ "iPhone" ];
        };
      };
    };
  };
}
