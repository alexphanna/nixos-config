{ host, ... }:
{
    home.file = {
        ".xinitrc" = {
            source = if host == "desktop" then ./desktopxinitrc else ./laptopxinitrc;
            executable = true;       
        };
        ".wallpaper.jpg".source = ./wallpaper.jpg;
    };
}