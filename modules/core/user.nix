{ pkgs, inputs, username, host, lib, ...}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = [ ./../homes/default.nix ];
      home.username = "${username}";
      home.homeDirectory = lib.mkForce "/home/${username}";
      home.stateVersion = "24.05";
      home.file = {
        ".xinitrc".text = ''
          while true; do
            volume="$(echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}') * 100" | bc | awk -F. '{print $1}')"
            if [ $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep "[MUTED]" -c) = 1 ]; then
              volume=" $volume%"
            else
              if (($volume >= 66)); then
                volume=" $volume%"
              elif (($volume >= 33)); then
                volume=" $volume%"
              else
                volume=" $volume%"
              fi 
            fi

            date=$(date "+%-m/%-d/%Y")
            time=$(date "+%-I:%M %p")
            xsetroot -name "$brightness  $battery  $volume  $date  $time "
          done &

          feh --bg-fill wallpaper.jpg

          xcompmgr &

          xrandr --output HDMI-0 --mode 1920x1080 --rate 74.97

          exec dwm
        '';
        "wallpaper.jpg".source = ./../../wallpaper.jpg;
      };
      programs.home-manager.enable = true;
    };
  };

  users.users.alex = {
    isNormalUser = true;
    description = "alex";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}
