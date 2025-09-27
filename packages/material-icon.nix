{
  pkgs,
  fetchFromGitHub,
}:
pkgs.stdenv.mkDerivation {
  pname = "material-icon";
  version = "4.0.0";

  src = fetchFromGitHub {
    owner = "google";
    repo = "material-design-icons";
    rev = "bb04090f930e272697f2a1f0d7b352d92dfeee43";
    hash = "sha256-rcbMMlRQVd+SwtEER7nntALw43cUPDA2ABZ8wUOA6k0=";
    sparseCheckout = [ "font" ];
  };

  installPhase = ''
    install -Dm755 font/*.ttf -t $out/share/fonts/TTF
    install -Dm755 font/*.otf -t $out/share/fonts/OTF
  '';
}