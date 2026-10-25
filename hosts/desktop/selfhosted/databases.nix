{ pkgs, ... }:
{
  services.mongodb.enable = true;
  # services.vector.enable = true;
  services.redis.enable = true;
  services.postgresql.enable = true;

  environment.systemPackages = with pkgs; [
    mongodb-compass
    rainfrog
  ];
}