{ inputs, ... }:
{
  imports = [
    inputs.flatpaks.nixosModules.default
  ];

  services.flatpak = {
    enable = true;

    remotes = {
      "flathub" = "https://flathub.org/repo/flathub.flatpakrepo";
    };

    packages = [
      "flathub:app/org.vinegarhq.Sober/x86_64/stable"
    ];
  };
}