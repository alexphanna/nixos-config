{ config, ... }:
{
  age.secrets.wg-quick = {
    file = ./../../secrets/secret1.age;
  };
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [
        "10.8.253.3/24"
        "fd11:5ee:bad:c0de::a08:fd03/64"
      ];
      dns = [
        "9.9.9.9"
        "149.112.112.112"
      ];
      privateKeyFile = config.age.secrets.wg-quick.path;
      peers = [
        {
          publicKey = "vHOG4r8dYcbc0guC3HPxI3DNo1KwhPabUw3OxmDkkRs=";
          presharedKey = "RAy+YLWefxhuIMHBrWj1NwLFpvMQsF+N9JHcg9Dy+R4=";
          allowedIPs = [
            "0.0.0.0/0"
            "::/0"
          ];
          endpoint = "71.224.70.236:51820";
        }
      ];
    };
  };
}
