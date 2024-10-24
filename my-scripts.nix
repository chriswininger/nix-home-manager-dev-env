{ pkgs? import <nixpkgs> {} }:

{
  tcls = pkgs.writeShellScriptBin "tcls" ''
    clear && reset
    
    if (
        [ "$TERM" = "screen" ] && [ -n "$TMUX" ]
      )
    then
      tmux clear-history
    fi
    
    if (
        [ "$TERM" = "screen-256color" ] && [ -n "$TMUX" ]
      )
    then
      tmux clear-history
    fi
    
    if (
        [ "$TERM" = "tmux-256color" ] && [ -n "$TMUX" ]
      )
    then
      tmux clear-history
    fi
    '';
}

