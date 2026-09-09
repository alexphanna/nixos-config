{ host, ... }:
{
  programs.sway = {
    enable = true;
    extraOptions =
      if (host == "desktop") then
        [
          "--unsupported-gpu"
        ]
      else
        [ ];
  };
}