{ lib
, buildPythonApplication
, fetchPypi
, uv-build
, pandas
, plotille
, ffmpeg
, tqdm
}:

buildPythonApplication rec {
  pname = "ffmpeg-bitrate-stats";
  version = "1.3.4";
  pyproject = true;

  src = fetchPypi {
    pname = "ffmpeg_bitrate_stats";
    inherit version;
    hash = "sha256-ul0kHVhMcL15ttcnbu8SBMQuAwM0h62S3lPnW6dNqVA=";
  };

  build-system = [
    uv-build
  ];

  dependencies = [
    pandas
    plotille
    tqdm
  ];

  # The application invokes ffprobe at runtime.
  makeWrapperArgs = [
    "--prefix PATH : ${lib.makeBinPath [ ffmpeg ]}"
  ];

  pythonImportsCheck = [
    "ffmpeg_bitrate_stats"
  ];

  # Upstream tests require media fixtures.
  doCheck = false;

  meta = {
    description = "Calculate bitrate statistics using FFmpeg";
    homepage = "https://github.com/slhck/ffmpeg-bitrate-stats";
    license = lib.licenses.mit;
    mainProgram = "ffmpeg-bitrate-stats";
    platforms = lib.platforms.unix;
  };
}