{
  pkgs,
  ...
}:
{
  programs.librewolf.profiles.default.extensions = {
    force = true;
    packages = with pkgs.nur.repos.rycee.firefox-addons; [
      redirector
    ];
    settings = {
      "redirector@einaregilsson.com" = {
        force = true;
        settings = {
          redirects = [
            {
              description = "NixOS Official Wiki";
              exampleUrl = "https://nixos.wiki/wiki/Firefox";
              exampleResult = "https://wiki.nixos.org/wiki/Firefox";
              includePattern = "https://nixos.wiki/wiki/*";
              redirectUrl = "https://wiki.nixos.org/wiki/$1";
              patternType = "W";
              appliesTo = [ "main_frame" ];
            }
            {
              description = "Minecraft Wiki";
              exampleUrl = "https://minecraft.fandom.com/wiki/Brick";
              exampleResult = "https://minecraft.wiki/w/Bricks";
              includePattern = "https://minecraft.fandom.com/wiki/*";
              redirectUrl = "https://minecraft.wiki/w/$1";
              patternType = "W";
              appliesTo = [ "main_frame" ];
            }
            {
              description = "Twitter";
              exampleUrl = "https://x.com/User";
              exampleResult = "https://nitter.net/User";
              includePattern = "https://x.com/*";
              redirectUrl = "https://nitter.net/$1";
              patternType = "W";
              appliesTo = [ "main_frame" ];
            }
          ];
        };
      };
    };
  };
}
