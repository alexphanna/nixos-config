{
  services.syncthing = {
    enable = true;
    user = "alex";
    configDir = "/home/alex/.config/syncthing";
    settings = {
      gui = {
        user = "alex";
        password = "";
      };
      devices = {
        "iPhone" = {
          id = "4XMJ7NX-VJXEAXJ-JW3XLVE-LKYC4YC-QK2EX4S-D3ZVV3J-SON6CR6-PKV7IAD";
        };
      };
      folders = {
        "Vault" = {
          path = "/home/alex/Documents/vault";
          devices = [ "iPhone" ];
        };
      };
    };
  };
}
