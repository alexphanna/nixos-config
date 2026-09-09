{
  imports = [
    ./apps/librewolf/librewolf.nix
    ./apps/librewolf/redirector.nix
    ./apps/librewolf/ublock-origin.nix
    ./apps/discord.nix
    ./apps/foot.nix
    ./apps/git.nix
    # ./apps/libreoffice.nix
    ./apps/mpv.nix
    ./apps/spotify.nix

    ./dev/default.nix

    ./games/emulation.nix
    ./games/lutris.nix
    ./games/mangohud.nix
    ./games/minecraft.nix

    ./rice/gtk.nix
    ./rice/kde.nix
    ./rice/mako.nix
    ./rice/pointer-cursor.nix
    ./rice/sway.nix
    ./rice/swayidle.nix
    ./rice/waybar.nix
    ./rice/zsh.nix

    ./scripts.nix

    ./essentials.nix

    ./utilities.nix
  ];
}
