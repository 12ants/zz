#!/bin/bash
## gpg aaaa
OFS=$' \n\t'; 
mkdir ~/.safe 2>/dev/null; chmod 775 ~/.safe -R 2>/dev/null; 
####
[ -z "$start" ] && start="${HOME}/zz"; 
[ -z "$zz" ] && zz="${HOME}/zz"; 
####
gpgs=($(command ls --color=never -1 ${zz}/c/.gpg/*|col)); 
####
####
[ -e "$HOME/.safe/pw.sh" ]||(printf %b "\n\e[A -- pw: "; read -r "pw"; printf %b "$pw" > $HOME/.safe/pw.sh); pw="$(cat $HOME/.safe/pw.sh)"
####
for i in ${gpgs[*]}; do 
out="$(printf %b "$HOME/.config/${i/*\//}"|sed -e "s/\.gpg$//")"; 
echo -e "$i > $out"; 
gpg --pinentry-mode loopback --batch --passphrase-file="$HOME/.safe/pw.sh" -d $i > $out && echo ok||echo no; 
echo -e "\e[2m-\e[222b\e[0m\n"; 
done; 
####
