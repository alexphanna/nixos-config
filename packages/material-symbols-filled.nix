{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  rename,
  pkgs,
  unstableGitUpdater,
}:
stdenvNoCC.mkDerivation {
  pname = "material-symbols";
  version = "4.0.0-unstable-2024-05-17";

  src = fetchFromGitHub {
    owner = "google";
    repo = "material-design-icons";
    rev = "bb04090f930e272697f2a1f0d7b352d92dfeee43";
    hash = "sha256-aFKG8U4OBqh2hoHYm1n/L4bK7wWPs6o0rYVhNC7QEpI=";
    sparseCheckout = [ "variablefont" ];
  };

  nativeBuildInputs = [
    rename
    pkgs.python3Packages.fonttools
  ];

  installPhase = ''
    runHook preInstall

    rename 's/\[FILL,GRAD,opsz,wght\]//g' variablefont/*

    for font in variablefont/*.ttf; do
      fonttools varLib.mutator "$font" FILL=1 -o "$font"
    done

    install -Dm755 variablefont/*.ttf -t $out/share/fonts/TTF

    runHook postInstall
  '';

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "Material Symbols icons by Google";
    homepage = "https://fonts.google.com/icons";
    downloadPage = "https://github.com/google/material-design-icons";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [
      fufexan
      luftmensch-luftmensch
    ];
    platforms = lib.platforms.all;
  };
}
