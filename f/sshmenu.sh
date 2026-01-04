#!/bin/bash
## ssh local lan menu
sshmenu() { function ssh4menu () { local IFS=$'\n\t '; unset mark; local ops=($2); [ -z "$2" ] && local ops=(*); local prompt="$1" index="0" cur="0" count="${#ops[@]}"; printf "\n\e[?25l\e[96m --\e[0m\e[2m [\e[0m$prompt\e[2m]\e[0m\e[96m --\e[0m\n\n"; while true; do local index="0"; for o in "${ops[@]}"; do if [ "$index" == "$cur" ]; then printf %b "\e[0m > \e[7m $o \e[0m\e[K\n"; else printf %b "\e[0m    $o \e[K\n"; fi; (( index++ )); done; read -srn1 key; if [[ "$key" == A ]]; then (( cur-- )); (( cur < 0 )) && (( cur = 0 )); else if [ "$key" == B ]; then (( cur++ )); (( cur >= count )) && (( cur = count - 1 )); else if [[ "$key" == C ]]; then [ ${mark[$cur]} = 0 ] && mark[$cur]=1 || mark[$cur]=0; printf %b "\e[K ${mark[@]} ${ops[$mark]} \e[K"; else if [[ $key == "" ]]; then break; else if [[ $key == "q" ]]; then return 1; fi; fi; fi; fi; fi; for i in ${!mark[*]}; do [ "${mark[$i]}" = 1 ] && printf %b "${ops[$i]} ok\n"; done; printf %b "\e[${count}A"; done; printf -v sel "${ops[$cur]}"; printf "\n\e[?25h    \e[7m $sel \e[0m\n"; }; 
################################
____() { printf %b "\n\n\n\n\n\n\n\n\e[8A"; }; 
____
ssh2menu() { ipgate="192.168.0"; 
____
ssh4menu "ssh/mosh" "$(printf %b ${ipgate}.{14,19,17,20}\\n ${ipgate}.{1..10}\\n)"||(printf %b "\e[?25h\n"; return 1)||return 0; selip="${sel}"; 
____ 
ssh4menu "port" "$(printf %b 22\\n8022)"||(printf %b "\e[?25h\n"; return 1)||return 0; 
selpo="${sel}"; printf %b "\n\n\n\n\e[4A\n    \e[96m--\e[0muser "; read -rep ' ' -i "aa" "selus"; 
____ 
ssh4menu "connection" "$(printf %b ssh\\nmosh)"||(printf %b "\e[?25h\n"; return 1)||return 0; 
selcon="${sel}"; [ $selcon = mosh ] && sp='-P' || sp='-p'; 
____ 
printf %b "$selcon $sp $selpo ${selus}@${selip}\n"|tee -a $HISTFILE; 
printf %b "$selcon $sp $selpo ${selus}@${selip}\n"; history -a; history -n; 
____
$selcon $sp $selpo ${selus}@${selip}; 
____
printf %b "\n-------- $selcon exit --------\n"; 
printf %b "$selcon $sp $selpo  ${selus}@${selip}\n"; echo; }||return 0; ssh2menu; }; 
