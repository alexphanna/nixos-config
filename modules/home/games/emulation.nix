{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pcsx2
    (shadps4.overrideAttrs (oldAttrs:  {
      src = fetchFromGitHub {
        owner = "AzaharPlus";
        repo = "shadPS4Plus";
        tag = "SHAD_PS4_PLUS_0_11_0";
        hash = "sha256-puyINtFBTdMkOE2E9OnUlZ526vXHCWyKIWsZBaojQRk=";
        fetchSubmodules = true;
      };
    }))
  ];
}