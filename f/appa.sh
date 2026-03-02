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
[ -e $HOME/logs/appa.log ] || (printf %b "\n\n\e[A $c2 getting list \e[2m...\e[0m \n"; appa.get); 
####
apha="$(($(($(date +%s) - $(stat -tc %Z $HOME/logs/appa.log)))/3600))";
####
printf %b "\n\n\n\n\n\n\e[5A"; 
printf %b " $c2 last fetched \e[36m${apha}\e[0m hours ago\e[2m ... \n"; 
printf %b " $c2 refresh list\e[2m?\e[0m [\e[2my\e[0m/\e[0m\e[92mN\e[0m] "; 
read -sn1 "aptget"; [ "$aptget" = "y" ] && printf %b " getting\e[2m ...\e[0m " && appa.get; 
#### 
####
[ $PREFIX ]&& ph="top,14" || ph="top,25"; 
####
appa=($(cat $HOME/logs/appa.log|FZF_DEFAULT_OPTIONS= command fzf --ansi --cycle -m -i --preview \
'apt show {1} 2>/dev/null|grep -vE "Priority|Download-Size|Origin|Bugs|Section|Version|Maintainer|APT-Sources"|sed -e "s/Description\:\ /\n----\n----\n\n/"|tac --separator "----"|sed -e "/^$/d"|bat -ppfljava --theme Nord' \
--preview-window "wrap,border-down,$ph" \
--no-border \
--bind 'change:first' \
--color 'bg:59,preview-bg:232,border:12' --info inline --no-unicode | \
sed -e "s/\s.*//")); 
####
####
echo; 
echo; 
####
####
[ "${appa}" ] && printf %b "\n\n\e[A\e[0m 
\e[96m----\e[0m
${appa[*]}
\e[96m----\e[0m
\e[2m[\e[0mI\e[2m]\e[0mnstall\e[96m :: \e[2m[\e[0mR\e[2m]\e[0memove \e[96m:: \e[2m[\e[0mQ\e[2m]\e[0muit \n\n" && read -rsn1 "nn" || \
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
