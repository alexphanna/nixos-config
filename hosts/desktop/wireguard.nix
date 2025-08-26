{ config, ... }:
{
  age.secrets.wg-quick = {
    file = ./../../secrets/secret2.age;
  };
  networking.wg-quick.interfaces = {
    wg0 = {
      autostart = false;
      address = [
        "10.2.0.2/32"
      ];
      dns = [
        "10.2.0.1"
      ];
      privateKey = config.age.secrets.wg-quick.path;
      peers = [
        {
          publicKey = "F/2MSsC7RsfHojjhonhgo40IRmyP3YEYsjoBQW+dwyY=";
          allowedIPs = [
            "0.0.0.0/0"
          ];
          endpoint = "146.70.156.2:51820";
        }
      ];
    };
  };
}
