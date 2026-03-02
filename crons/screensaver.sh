
ok="$(echo $HISTFILE)"; 
[ $ok ]||ok="/home/aa/.bash_history"; 
ep="$(date +%s)"; 
hp="$(stat -tc %Z $ok)"; 
####
printf %b "$((ep - hp))"; 
since="$((ep - hp))"; 
####
[ $since -gt 22 ] && (date; echo "$since seconds without activity\n-\e[222b") >> /home/aa/logs/screensaver.log
####
. /home/aa/zz/f/ok.sh; 


#timeout 5 (
. /home/aa/zz/f/klockan.sh && klockan > /dev/pts/$(ls -1 -t /dev/pts|grep -v "ptmx"|tail -n1); 



#klockan() { printf %b "\e[?25l"; while :; do printf %b "\ec\e[$((LINES/2-18))B"; ok "$(date +%A)"; printf %b "\e[4A"; ok "$(date +%R)"; gum style --border none --width $((COLUMNS)) --align center --padding "0" --border-foreground 8 "$(gum style --border normal --padding "1 2" --border-foreground 8 "$(kolor="$(shuf -en1 31 32 33 34 35 36 91 92 93 95 96)"; while :; do ff="$(fortune)"; [ ${#ff} -lt 155 ] && printf %b "\e[1m${ff}"|fmt -w $((COLUMNS-8)) --split-only|sed -e "s/[\"\'-:.,;?\!]/\x1b[${kolor};1m&\x1b[0;1m/g" && break; done)")"||break; printf %b "\e[?25l"; read -sen1 -t12 kkkk && [ $kkkk ] && printf %b "\e[?25h\ec" && break; done; }; 
