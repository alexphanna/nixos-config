{ pkgs, ... }:
/*let
  myPython = pkgs.python3.withPackages (
    python-pkgs: with python-pkgs; [
      psutil
      jobspy
      faker
      pynput
      beautifulsoup4
      lxml
      pywinctl
      tkinter
      sklearn-compat
      pycrypto
      fonttools
      psycopg2
    ]
  );
in*/
{
  home.packages = with pkgs; [ python3 ];

  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    ms-python.python
    ms-python.vscode-pylance
  ];
}
