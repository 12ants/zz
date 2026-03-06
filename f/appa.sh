#!/bin/bash
#### appa apt getter better 
unalias appa 2>/dev/null; 
####
appa() { IFS=$' \n\t'; c2='\e[0m\e[96m --\e[0m'; 
####
####
appa.get() { $sudo apt update &>/dev/null; $sudo apt list --verbose 2>/dev/null|tail -n+2|tr -s "\t " " "|sed -e "s/\/.*\[installed\]/\ \x1b[2m\ [\x1b[0m\x1b[1m\x1b[92mi\x1b[0m\x1b[2m]\ \x1b[92m/g" -e "s/.*\[i\]/\x1b[2m&\ /g" -e "1~3s/\/.*/ \x1b[31m>\x1b[0m\x1b[2m/" -e "s/^$/____/g"|tr -d "\n\t"|sed -e "s/____/\x1b[0m\n/g" -e "/^lib*/d"|sort > $HOME/logs/appa.log; apha="$(($(($(date +%s) - $(stat -tc %Z $HOME/logs/appa.log)))/3600))"; }; 
####
####
[ -e $HOME/logs/appa.log ] || (printf %b "\n\n\e[A$c2 getting list \e[2m...\e[0m \n"; appa.get); 
####
# apha="$(($(($(date +%s) - $(stat -tc %Z $HOME/logs/appa.log)))/60))"; printf -v hh %b "$(($(($(date +%s) - $(stat -tc %Z $HOME/logs/appa.log)))/3600))"; 

printf -v mm %b "$(($(($(date +%s) - $(stat -tc %Z $HOME/logs/appa.log)))/60+hh*60))"; 

# printf %b "$hh:$mm"; 
####
# printf %b "\n\n\e[4A\n\n"; 
printf %b "\n$c2 last fetched \e[36m$hh\e[0m hours and \e[95m$mm\e[0m mins ago\e[2m ... \n\n\e[A"; 
printf %b "$c2 refresh list\e[95m?\e[0;2m [\e[0;93my\e[0;2m/\e[0m\e[92;1mN\e[0;2m]\e[0m "; 
read -sn1 "aptget"; printf %b "\e[92mok"; 
[ "$aptget" = "y" ] && printf %b " getting\e[2m ...\e[0m " && appa.get; 
[ "$aptget" = "q" ] && echo && echo && return 0; 
#### 
####
[ $PREFIX ]&& ph="bottom,14" || ph="bottom,25"; 
####

appa=($(cat $HOME/logs/appa.log|FZF_DEFAULT_OPTIONS= command fzf --ansi --cycle -m -i -e --preview \
'printf %b '"'\e[96;1m{1}\e[0;2m |\e[0m '"'; apt show {1} 2>/dev/null|grep -wvE "Priority|Download-Size|Origin|Bugs|Section|APT-Manual|Essential|Status|Version|Maintainer|APT-Sources|Package"|sed -e "s/Description:\ /\n----\n----\n/g" -e "s/Installed\-/\n/g"|tac --separator "----"|sed -e "/^$/d"|bat -ppfljava --theme Nord' \
--preview-window "wrap,border-none,$ph" \
--preview-wrap-sign "" \
--wrap \
--wrap-sign "" \
--pointer "" \
--highlight-line \
--ellipsis "-" \
--no-border \
--bind 'change:first,q:abort,0:change-preview-window(right,50%|bottom,40%|hidden),tab:toggle+down+transform-header:[ "$FZF_SELECT_COUNT" -gt 0 ] && colight=(110 209 143 103 205 77 150 194 77 131 194 110 152 149 188 146 189 146 218 188 78 181); fl=($(cat {+f}|cut -f1 -d" ")); for i in ${!fl[*]}; do printf %b "\e[38;5;${colight[i]}m${fl[i]} "; done|tr -s "\n" " "|fmt -w $((FZF_COLUMNS*2-5))' \
--info inline \
--color 'bg:236,preview-bg:232,border:12,bg+:197,hl+:0' --info inline --no-unicode \
--accept-nth 1)); if [ $? = 130 ]; then 
printf %b "\e[92mok\e[0;2m ... \e[0m\n\n"; return 0; fi; 
# |sed -e "s/\s.*//"
####
####
echo; 
echo; 
####
####
[ "$appa" ] && printf %b "\n\e[A\e[0m\e[96m-\e[222b\e[0m\n "; k=0; 
[ -e $PREFIX/bin/pastel ] && cc=($(pastel random|pastel lighten .1|pastel format ansi-8bit-value)); 
for op in ${!appa[*]}; do printf %b "\e[0;2m--\e[0m\e[38;5;${cc[op]}m ${appa[op]} \e[0m"; done; 
printf %b "\e[2m --\e[0m\n";
printf %b "\e[96m-\e[222b\e[0m\n\n\n\n\n\e[4A"; 
printf %b "\n \e[96m::\e[0m \e[2m[\e[0mI\e[2m]\e[0mnstall\e[96m :: \e[0;2m[\e[0mR\e[2m]\e[0memove \e[96m:: \e[0;2m[\e[0mQ\e[2m]\e[0muit \e[96m:: \e[92m" && read -rsn1 "nn" || \
printf %b "ok\n\n"; case $nn in q|x|Q|X) echo ok; echo; return 0;; r|R) $sudo apt remove -y ${appa[*]} && printf %b " $c2 autoremove? [Y/n]? "; read -sn1 "nasd"; [ -z "$nasd" ] && $sudo apt -y autoremove; return 0;; i|I) history -s "appa"; history -s "$sudo apt install -y ${appa[*]}"; history -a; history -n; $sudo apt install -y ${appa[*]}; printf %b " $c2 autoremove? [Y/n]? "; read -sn1 "nasd"; [ -z "$nasd" ] && $sudo apt -y autoremove;; esac; 
####
####
$sudo apt update &>/dev/null & disown; printf %b "\e[A\e[K"; 
appa.get 2>/dev/null & disown; printf %b "\e[A\e[K"; 
####
echo; 
echo; 
####
}; 
