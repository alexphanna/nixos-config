{ host, ... }:
{
    home.file = {
        ".xinitrc".source = if host == "desktop" then ./desktopxinitrc else ./laptopxinitrc;
        ".wallpaper.jpg".source = ./wallpaper.jpg;
    };
}