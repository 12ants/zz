#!/bin/bash
## install essential apps
IFS=$' \n\t'; 
hash sudo 2>/dev/null && sudo=sudo; 
####
esapps=(\
"git" \
"gh" \
"gnupg" \
"cronie" \
"cron" \
"micro" \
"openssh-server" \
); 
#### 
rcrc=(152 194 149 104 97 116 152 189 187 153 225 254 151 158 141 116 76 133 182 152 175 254); 
####
printf %b "\n\n\n\n\e[4A\e[96m\n --\e[0m insalling: "; 
####
for i in ${esapps[*]}; do 
####
printf %b "\e[38;5;$(shuf -en1 ${rcrc[*]} 2>/dev/null)m $i "; hash $i 2>/dev/null || $sudo apt install -y $i &>/dev/null; 
####
done; 
####
printf %b "\e[96m\n\n --\e[92m done\e[0;2m !\n\n\e[0m"; 
####
