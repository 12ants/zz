#!/bin/bash
## list figlet fonts
figfonts() { 
local IFS=$'\n\t '; figall=($(basename -a ${PREFIX-/usr}/share/figlet/*.flf ${PREFIX-/usr}/share/figlet/*.tlf|sed -e 's/\..*//g')); 
####
fig=($(printf %b "${figall[*]}" | fzf -i --preview "figlet -f {} "${1-aZ8}"|bat -ppfl${2-java} && echo -e "${2-java}"; figlet -f {} {}|bat -ppfljs; printf %b "js"" --cycle --preview-window 'top,80%,noborder' --bind 'q:abort' --border 'none' --multi)); printf %b "\e[92m--\e[0m \${\e[95mfig\e[0m}\n\e[96m${ffzz[*]} \e[0m\n"; figlet -f $fig "${@-ok}"; }; 

##
# local FZF_DEFAULT_OPTS=; 
# figfonts() { local FZF_DEFAULT_OPTS=; IFS=$'\n\t '; ffzz=($(figlist|grep -vE ' |utf8'|command fzf --tmux 'center,100%,98%' -i --preview "figlet -f {} "$@"|bat -ppfljava; figlet -f {} {}|bat -ppfld" --cycle --wrap --preview-window 'top,50%,wrap,noborder' --wrap-sign '' --bind 'q:abort' --border 'none' --multi; )); printf %b "\n${ffzz[*]} \n--\n$\e[95m\ffzz\e[0m\n"|bat -ppflgo --strip-ansi; }; 


