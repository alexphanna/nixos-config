{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      # jdk25
      jdk21
      jetbrains.idea
      maven
    ];
    sessionVariables = {
      _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";
      _JAVA_AWT_WM_NONREPARENTING = 1;
      AWT_TOOLKIT = "MToolkit";
    };
  };
  programs.vscode.profiles.default = {
    extensions = with pkgs.vscode-extensions; [
      vscjava.vscode-java-pack
      redhat.java
      # fixes "command 'java.debug.runJavaFile' not found" error when using vscode-java-debug
      # source: https://github.com/manuelkocher/nixcfg/blob/15e7b1294dd2f023622b81636ee2b77cfbec5df8/modules/mixins/vscode-java-debug.nix#L5
      (vscjava.vscode-java-debug.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          substituteInPlace "$out/share/vscode/extensions/vscjava.vscode-java-debug/dist/extension.js" \
            --replace-fail 'o.join(t,".noConfigDebugAdapterEndpoints")' \
                          'o.join(process.env.XDG_RUNTIME_DIR||"/tmp","vscode-java-debug-endpoints")'
        '';
      }))
      vscjava.vscode-java-test
      vscjava.vscode-maven
      # vscjava.vscode-gradle
      vscjava.vscode-java-dependency
      visualstudioexptteam.vscodeintellicode
    ];
    userSettings = {
      "java.jdt.ls.java.home" = "${pkgs.jdk25}/lib/openjdk";
    };
  };
}
