{ 
  imports = [
    ./apps/discord.nix
    ./apps/firefox.nix
    ./apps/foot.nix
    ./apps/git.nix
    ./apps/libreoffice.nix
    ./apps/mpv.nix

    ./dev/cpp.nix
    ./dev/dart.nix
    ./dev/game-maker.nix
    ./dev/go.nix
    ./dev/java.nix
    ./dev/javascript.nix
    ./dev/latex.nix
    ./dev/macos.nix
    ./dev/nix.nix
    ./dev/python.nix
    # ./dev/swift.nix
    ./dev/vscode.nix

    ./games/emulation.nix
    ./games/lutris.nix
    ./games/mangohud.nix
    ./games/minecraft.nix

    ./rice/gtk.nix
    ./rice/mako.nix
    ./rice/pointer-cursor.nix
    ./rice/sway.nix
    ./rice/waybar.nix
    ./rice/zsh.nix

    ./scripts.nix

    ./essentials.nix
    
    ./utilities.nix
  ];
}
