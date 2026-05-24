#!/bin/bash
## install essential apps
IFS=$' \n\t'; 
hash sudo 2>/dev/null && sudo=sudo && export sudo="sudo"; 
####
esapps=(\
"fzf" \
"git" \
"gh" \
"gnupg" \
"cronie" \
"micro" \
"openssh-server" \
); 
####
debs=($HOME/zz/setup/debs/*.deb)
bins=($HOME/zz/setup/bins/*)
#### 
rcrc=(152 194 149 104 97 116 152 189 187 153 225 254 151 158 141 116 76 133 182 152 175 254); 
####
#### update
printf %b "\n\n\n\n\e[4A\e[96m\n --\e[0m updating repos\e[2m...\e[0m "; 
$sudo apt update 2>/dev/null; 
####
####
printf %b "\n\e[96m\n --\e[0m insalling\e[2m:\e[0m ";  
####
#### apts
for i in ${esapps[*]}; do printf %b "\e[38;5;$(shuf -en1 ${rcrc[*]} 2>/dev/null)m $i "; hash $i 2>/dev/null || $sudo apt install -y $i &>/dev/null; done; 
####
#### debs
printf %b "\n\e[96m\n --\e[0m insalling debs: "; 
[ -z "$PREFIX" ] && for i in ${debs[*]}; do printf %b "\e[38;5;$(shuf -en1 ${rcrc[*]} 2>/dev/null)m $i "; hash $i 2>/dev/null || $sudo apt install -y $i &>/dev/null; done; 
####
#### bins
printf %b "\n\e[96m\n --\e[0m insalling bins: "; 
mkdir -pm 755 "$HOME/.local/bin" 2>/dev/null; [ -z "$PREFIX" ] && for i in ${bins[*]}; do printf %b "\e[38;5;$(shuf -en1 ${rcrc[*]} 2>/dev/null)m $i "; hash $i 2>/dev/null || cp $i -t $HOME/.local/bin 2>/dev/null; done; 
####
#### done
printf %b "\e[96m\n\n --\e[92m done\e[0;2m !\n\n\e[0m"; 
####
####
