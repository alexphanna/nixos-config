{
  inputs,
  username,
  host,
  lib,
  accentColor,
  backgroundColor,
  foregroundColor,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host accentColor backgroundColor foregroundColor; };
    users.${username} = {
      imports = [ ./../home/default.nix ];
      home.username = "${username}";
      home.homeDirectory = lib.mkForce "/home/${username}";
      home.stateVersion = "24.11";
      programs.home-manager.enable = true;
    };
  };
}