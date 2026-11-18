{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  makeWrapper,
  ffmpeg,
  mkvtoolnix,
  mediainfo,
  dovi-tool,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "dovi-convert";
  version = "8.2.0";

  src = fetchFromGitHub {
    owner = "cryptochrome";
    repo = "dovi_convert";
    rev = "67fbcaf363a01dc4f348c039db6df8b59360f37e";
    hash = "sha256-owLI0/8BP+pZECgUca3Myc7ngzA8GZZS6pycHrkibK0=";
  };

  nativeBuildInputs = [
    makeWrapper
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -Dm755 dovi_convert.py \
      $out/libexec/dovi_convert/dovi_convert.py

    patchShebangs $out/libexec/dovi_convert/dovi_convert.py

    makeWrapper \
      $out/libexec/dovi_convert/dovi_convert.py \
      $out/bin/dovi_convert \
      --prefix PATH : ${lib.makeBinPath [
        ffmpeg
        mkvtoolnix
        mediainfo
        dovi-tool
      ]}

    runHook postInstall
  '';

  meta = {
    description = "Convert Dolby Vision Profile 7 MKV files to Profile 8.1";
    homepage = "https://github.com/cryptochrome/dovi_convert";
    license = lib.licenses.gpl3Plus;
    mainProgram = "dovi_convert";
    platforms = lib.platforms.unix;
  };
})