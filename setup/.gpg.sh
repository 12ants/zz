#!/bin/bash
## gpg aaaa
IFS=$' \n\t'; 
mkdir ${HOME}/.config 2>/dev/null; 
mkdir ${HOME}/.config/keys 2>/dev/null; 
# chmod 775 ~/.safe -R 2>/dev/null; 
####
zz="${zz:=${HOME}/zz}"; start="${zz:=${HOME}/zz}"; 
####
hash sudo 2>/dev/null && sudo=sudo;
hash gpg 2>/dev/null || $sudo apt install gnupg -y; 
####
gpg --passphrase="" --quick-generate-key $(whoami) rsa1024 2>/dev/null; 
####
gpgs=($(command ls --color=never -1 ${zz}/c/.gpg/*|col)); 
####
####
[ -e "$HOME/.safe/pw.sh" ]||(printf %b "\n\e[A -- pw: "; read -r "pw"; printf %b "$pw" > $HOME/.safe/pw.sh); pw="$(cat $HOME/.safe/pw.sh)"
####
declare -i kk=44; declare -i ll=55; 
printf %b "\n\n\n\n\e[4A\e[2m-\e[222b\e[0m\n\e[2K\e[s"; 
####
for i in ${gpgs[*]}; do 
####
out="$(printf %b "$HOME/.config/${i/*\//}"|sed -e "s/\.gpg$//")"; 
####
printf %b "\e[G\e[38;5;$((kk++))m $i\e[0m >\e[38;5;$((ll++))m $out \e[K\n\e[2m-\e[222b\e[0m\n"; 
####
gpg --pinentry-mode loopback --batch --passphrase-file="$HOME/.safe/pw.sh" -d $i > $out 2>/dev/null;
####
# printf %b "\n\e[2m-\e[222b\e[0m\e[u\e[2K\e[38;5;$((cc1++))m"; 
####
done; 
####
printf %b "\n\n\e[A"; 
####
