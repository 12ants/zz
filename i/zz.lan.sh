#!/bin/bash
zz.lan() { 
## discover lan w ping & ssh 
#ipt=$(mktemp; ); 
mkdir -p $HOME/logs/iplocal/ 2>/dev/null; 
rm $HOME/logs/iplocal/* 2>/dev/null;  
c5='    \e[96m--\e[0m'; 
c6='\e[96m--\e[0m'; 
wlan="$(cat $HOME/logs/wlan.log)"; 
iploc="$(cat $HOME/logs/wlan.log)"; 
# printf %b "\n\n\n\n\e[4A\n\e[96m --\n\e[0m "; 
# read -ep '> ' -i "${wlan[*]}" "iploc"; 
printf %b "\e[?25l\n$c5 checking ips\e[2m ...\e[0m \t\t [q]uit $c6\n\n\n\n\e[4A\n\n"; 
# ip -4 n
for ip in {0..266}; do printf %b "\e[K"; 
if ping -c2 ${iploc%.*}.${ip} &>/dev/null; 
then ipp="${iploc%.*}.${ip}"; 
printf %b "\e[K\n\n$ipp\e[K\e[A\e[K"; 
touch $HOME/logs/iplocal/$ipp; 
(nmap ${ipp} --open -p 22,8022 2>/dev/null|grep -e "open"|cut -f1 -d"/"|tr -s "\n" " ") > $HOME/logs/iplocal/${ipp} 
fi & disown; 
# printf %b "\e[K\n${iploc%.*}.$i" && 
printf %b "\e[K\e[A\e[K"; 
read -t 0.05 -n1 -s -p "${iploc%.*}.$ip " "ny"; [ $ny ] && printf %b "\n\n\e[?25h" && return 0 && break; done; 
# printf %b "${iploc%.*}.$i\n" >> "$ipt"& disown; \
printf %b "\e[?25h";  
printf %b "\e[K\n----------------\n\n"; 
# ipends=($(cat $ipt|cut -f4 -d"."; ));
rm $HOME/logs/iplocal/$iploc 2>/dev/null; 
iplocal=($(command ls $HOME/logs/iplocal; )); 
# iplocall=-($iploc);
# command ls "$HOME/logs/iplocal"; echo; 

# for ip in ${iplocal[*]}; do (nmap --open $ipp -p 22,8022 --system-dns 2>/dev/null|grep -e "open"|cut -f1 -d"/"|tr -s "\n" " ") > $HOME/logs/iplocal/$ipp; done; 

ls $HOME/logs/iplocal/|fzf

}; 
