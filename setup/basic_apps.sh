#!/bin/bash
## install extra basic apts etc
[ -z "$start" ] && start="${HOME}/zz"; 
##
# IFS=$' \t\n'; 
hash sudo 2>/dev/null && sudo="sudo"; 
rr="$((RANDOM%222))"; 
printf %b "\e[4H\e[0m -- \e[48;5;${rr}m updating \e[0m --\n\e[38;5;${rr}m "; 
$sudo apt update; 
rr="$((RANDOM%222))"; 
printf %b "\e[4H\e[0m -- \e[48;5;${rr}m upgrading \e[0m --\n\e[38;5;${rr}m "; 
$sudo apt upgrade -y; 
printf %b "\e[H\e[J "; 

# unset IFS; 
# unset appa apap; declare -a appa=($(command ls -p1 $start/install/ap|grep -v "*/")); declare -a apap; 
$sudo apt install -y openssh-server; 
$sudo apt install -y micro;  
$sudo apt install -y cron; 
##
unset appa done; appa=($(ls -1p $HOME/zz/setup/ap|grep -v '/')); for i in ${appa[*]}; do rr="\e[38;5;$((RANDOM%222+22))m"; hash $i && printf %b "\n$i -- installed \n" || $sudo apt install -y $i && done+=("$rr$i"); printf %b "\ec\e[0m\e[96m --\e[0m installed: ${done[*]} \n\n"; done; printf %b "\ec\n\n\e[0m\e[96m --\e[0m installed: \n\e[7m${done[*]}\e[0m\n\n";
#$

# printf %b "\ec\e[H${apap[*]}\e[0m -- Installing \n\e[J"; 
# printf %b "\e[4H\e[J\e[0m -- \e[48;5;${rr}m ${appa[i]} \e[0m -\e[555b\b\n\e[38;5;${rr}m "; 

# for i in ${appa[*]}; do rr="$((RANDOM%222))"; $sudo apt install -y $i --assume-yes && apap+=(\e[38;5;${rr}m$i}); printf %b "\e[H${apap[*]}\e[0m installed\e[J"; sleep .1; done; $sudo apt -y autoremove; 
# printf %b "\e[4H\e[0m -- \e[48;5;${rr}m installed \e[0m --\n\e[38;5;${rr}m \n\e[0m"; 
# printf %b "${apap[*]}\n\n\e[0m -- \e[48;5;82m\e[1;90m DONE \e[0m --\n\n"; 
sleep 1; 
####
## apt install -y autoconf libevent ncurses pkg-config automake; 
## mkdir $HOME/gh 2>/dev/null; cd $HOME/gh; gh repo clone tmux/tmux
####
