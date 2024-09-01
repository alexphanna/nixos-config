# NixOS Configuration
My NixOS and [home-manager](https://github.com/nix-community/home-manager) configuration.
## Information
### Software
| Item                 | Program    |
| :------------------: | :--------: |
| Operating System     | NixOS      |
| Window Manager       | dwm        |
| Application Launcher | dmenu      |
| Terminal Emulator    | st         |
| Shell                | zsh        |
| Internet Browser     | Firefox    |
| Text Editor          | VS Code    |
| File Manager         | Thunar     |
| Media Player         | mpv (uosc) |
## Installation
```shell
    git clone https://github.com/alexphanna/nixos-config.git
    cd nixos-config
    sudo nixos-rebuild switch --flake .#nixos
```
## Credits
- [Frost-Phoenix/nixos-config](https://github.com/Frost-Phoenix/nixos-config): layout inspiration