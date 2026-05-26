{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Launcher
    (prismlauncher.override {
      jdks = [
        jdk8
        jdk17
        jdk21
      ];
    })

    # Tools
    mcaselector
  ];
}
