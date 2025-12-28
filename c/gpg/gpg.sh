#!/bin/bash
## gpg aaaa
mkdir ~/.config/gpg 2>/dev/null; 
####
[ -z "$start" ] && start="${HOME}/zz"; 
####
gpgs=($(command ls -1 ${start}/c/gpg)); 
####
printf %b "\n\e[A -- pw: "; 
####
read -res "pw"; 
####
for i in ${gpgs[*]}; do 
echo $i; 
gpg -q --batch --pinentry-mode loopback --passphrase "$pw" -d $i | tee ~/.config/gpg/${i/.*/}.txt; 
done; 
####
