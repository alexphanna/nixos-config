{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      jdk23
    ];
    sessionVariables = {
      _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";
      _JAVA_AWT_WM_NONREPARENTING = 1;
      AWT_TOOLKIT = "MToolkit";
    };
  };
  programs.vscode.profiles.default = {
    extensions = with pkgs.vscode-extensions; [
      redhat.java
      vscjava.vscode-java-debug
      vscjava.vscode-java-test
      # vscjava.vscode-maven
      # vscjava.vscode-gradle
      vscjava.vscode-java-dependency
      visualstudioexptteam.vscodeintellicode
    ];
    userSettings = {
      "java.jdt.ls.java.home" = "${pkgs.jdk23}";
    };
  };
}