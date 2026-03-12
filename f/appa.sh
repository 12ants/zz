#!/bin/bash
#### appa apt getter better 
unalias appa 2>/dev/null; 
####
appa() { IFS=$' \n\t'; c2='\x1b[0m\x1b[96m --\x1b[0m'; 
####
####
appa.get() { $sudo apt update &>/dev/null; $sudo apt list --verbose 2>/dev/null|tail -n+2|tr -s "\t " " "|sed -e "s/\/.*\[installed\]/\ \x1b[2m\ [\x1b[0m\x1b[1m\x1b[92mi\x1b[0m\x1b[2m]\ \x1b[92m/g" -e "s/.*\[i\]/\x1b[2m&\ /g" -e "1~3s/\/.*/ \x1b[96m>\x1b[0m\x1b[37m/" -e "s/^$/____/g"|tr -d "\n\t"|sed -e "s/____/\x1b[0m\n/g" -e "/^lib*/d"|sort > $HOME/logs/appa.log; apha="$(($(($(date +%s) - $(stat -tc %Z $HOME/logs/appa.log)))/3600))"; }; 
####
####
[ -e $HOME/logs/appa.log ] || (printf %b "\n\n\x1b[A$c2 getting list \x1b[2m...\x1b[0m \n"; appa.get); 
####
# apha="$(($(($(date +%s) - $(stat -tc %Z $HOME/logs/appa.log)))/60))"; printf -v hh %b "$(($(($(date +%s) - $(stat -tc %Z $HOME/logs/appa.log)))/3600))"; 

printf -v mm %b "$(($(($(date +%s) - $(stat -tc %Z $HOME/logs/appa.log)))/60+hh*60))"; 

# printf %b "$hh:$mm"; 
####
# printf %b "\n\n\x1b[4A\n\n"; 
printf %b "\n$c2 last fetched \x1b[36m$hh\x1b[0m hours and \x1b[95m$mm\x1b[0m mins ago\x1b[2m ... \n\n\x1b[A"; 
printf %b "$c2 refresh list\x1b[95m?\x1b[0;2m [\x1b[0;93my\x1b[0;2m/\x1b[0m\x1b[92;1mN\x1b[0;2m]\x1b[0m "; 
read -sn1 "aptget"; printf %b "\x1b[92mok"; 
[ "$aptget" = "y" ] && printf %b " getting\x1b[2m ...\x1b[0m " && appa.get; 
[ "$aptget" = "q" ] && echo && echo && return 0; 
#### 
####
[ $PREFIX ]&& ph="bottom,14%" || ph="bottom,~25"; 
################
################
################ ____ FZF ____
appa=($(local FZF_DEFAULT_OPTIONS=""; cat $HOME/logs/appa.log|command fzf --ansi --cycle -m -i --preview \
'printf %b '"'\x1b[96;1m{1}\x1b[0;2m |\x1b[0m '"'; apt show {1} 2>/dev/null|grep -wvE "Priority|Download-Size|Origin|Bugs|Section|APT-Manual|Essential|Status|Version|Maintainer|APT-Sources|Package"|sed -e "s/Description:\ /\n----\n----\n/g" -e "s/Installed\-/\n/g"|tac --separator='----'|sed -e "/^$/d"|bat -ppfljava --theme Nord' \
--preview-window "wrap,border-none,$ph" \
--preview-wrap-sign "" \
--wrap \
--wrap-sign "" \
--pointer "" \
--highlight-line \
--ellipsis "-" \
--no-border \
--unicode \
--ghost "0:toggle_preview " \
--bind 'change:first,q:abort,0:change-preview-window(right,50%|bottom,40%|hidden),tab:toggle+down+transform-header:[ "$FZF_SELECT_COUNT" -gt 0 ] && colight=(110 209 143 103 205 77 150 194 77 131 194 110 152 149 188 146 189 146 218 188 78 181); fl=($(cat {+f}|cut -f1 -d" ")); for i in ${!fl[*]}; do printf %b "\x1b[1;38;5;${colight[i]}m\x1b[7m${fl[i]}"; done|tr -s "\n" " "|fmt -w $((FZF_COLUMNS*2-5))' \
--info inline \
--color 'bg:234,preview-bg:236,border:12,bg+:125' \
--info inline \
--highlight-line \
--no-unicode \
--accept-nth 1)); 
####
if [ $? = 130 ]; then printf %b "\x1b[92mok\x1b[0;2m ... \x1b[0m\n\n"; return 0; fi; 
####
####
echo; 
echo; 
####
####
[ "$appa" ] && printf %b "\n\x1b[A\x1b[0m\x1b[96m-\x1b[222b\x1b[0m\n "; k=0; 
[ -e $PREFIX/bin/pastel ] && cc=($(pastel random|pastel lighten .1|pastel format ansi-8bit-value)); 
for op in ${!appa[*]}; do printf %b "\x1b[0;2m--\x1b[0m\x1b[38;5;${cc[op]}m ${appa[op]} \x1b[0m"; done; 
printf %b "\x1b[2m --\x1b[0m\n";
printf %b "\x1b[96m-\x1b[222b\x1b[0m\n\n\n\n\n\x1b[4A"; 
printf %b "\n \x1b[96m::\x1b[0m \x1b[2m[\x1b[0mI\x1b[2m]\x1b[0mnstall\x1b[96m :: \x1b[0;2m[\x1b[0mR\x1b[2m]\x1b[0memove \x1b[96m:: \x1b[0;2m[\x1b[0mQ\x1b[2m]\x1b[0muit \x1b[96m:: \x1b[92m" && read -rsn1 "nn" || \
printf %b "ok\n\n"; 
####
####
case $nn in \
"")  instrem=install;; 
I|i) instrem=install;; 
R|r) instrem=remove;; 
Q|q) history -s "$(printf %b "${appa[*]}")"; printf %b "\n${appa[*]}\n"; return 0;; 
################################
esac; 
####
####
history -s "$(printf %b "$sudo apt $instrem -y ${appa[*]}")"; 
history -a; history -n; 
####
$sudo apt $instrem -y ${appa[*]}; 
####
####
printf %b "\n $c2 update & autoremove? [Y/n]? "; 
read -sn1 "nasd"; [ -z "$nasd" ] && \
$sudo apt update 2>/dev/null; 
$sudo apt -y autoremove; 
printf %b "\n\n $c2 ${instrem}ed ${appa[*]} \n\n"; 
################################################
}; 
