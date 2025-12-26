#!/bin/bash
info12() { unalias fzf; local FZF_DEFAULT_OPTS=; way="$HOME/zz/i"; ioio="$(ls -1p ~/zz/i|fzf-tmux -w 100% -h 100% -m -i --ansi --bind "0:change-preview-window(right,50%|top,20%|top,55%|right,20%|hidden),q:abort" --info inline --inline-info --no-border --preview-window "right,80%,wrap,noborder" --preview "bat -ppf ${way}/{} 2>/dev/null||ls --color always -pm ${way}/{}")"; [ "$ioio" ] && bat -pfljava ${way}/${ioio}; }; 
alias 12info='info12'; 
