{ config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initContent = ''
      PROMPT="%~%F{5} > %f"
      bindkey "^[[1;3C" forward-word
      bindkey "^[[1;3D" backward-word
    '';
  };
}
