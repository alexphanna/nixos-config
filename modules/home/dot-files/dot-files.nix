{ host, ... }:
{
    home.file = {
        ".xinitrc".source = if host == "desktop" then ./desktop.xinitrc else ./laptop.xinitrc;
        ".wallpaper.jpg".source = ./wallpaper.jpg;
    };
}