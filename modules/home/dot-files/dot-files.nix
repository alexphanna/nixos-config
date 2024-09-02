{ host, ... }:
{
    home.file = {
        ".xinitrc".source = if host == "desktop" then ./xinitrc.desktop else ./xinitrc.laptop;
        ".wallpaper.jpg".source = ./wallpaper.jpg;
    };
}