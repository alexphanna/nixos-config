{ config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      code = "code --wait --new-window";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initContent = ''
      PROMPT="%~%F{93} > %f"
      bindkey "^[[1;3C" forward-word
      bindkey "^[[1;3D" backward-word
    '';
    /*profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
          exec sway
      fi
    '';*/
  };
}
