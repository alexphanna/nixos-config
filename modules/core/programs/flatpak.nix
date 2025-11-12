{ inputs, ... }:
{
  imports = [
    inputs.flatpaks.nixosModules.default
  ];

  services.flatpak = {
    enable = true;
    # forceRunOnActivation = true;

    remotes = {
      "flathub-beta" = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    };

    packages = [
      "flathub-beta:app/com.stremio.Stremio/x86_64/stable"
    ];
  };
}