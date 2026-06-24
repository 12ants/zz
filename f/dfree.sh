#!/usr/bin/env bash
dfree() { 
####
local IFS=$'\n\t ' l="·" o="0" dk=(028 114 151 152 247 143 220 209 200 196); 
####
[ -n "$PREFIX" ] && df=($(df -H|grep -E '(fuse)'|grep -vE '(0000000000)'|column --table --table-columns "FS,TOT,USE,FREE,PER,Mounted,00%" --table-order 1,6,2,3,4)); 
[ -z "$PREFIX" ] && df=($(df -H|grep -vE '(tmpfs|efivar|none|Size|boot)'|column --table --table-columns "FS,TOT,USE,FREE,PER,Mounted,00%" --table-order 1,6,2,3,4)); 
####
####
if [ "$PREFIX" ]; then 
####
for i in ${!df[*]}; do printf %b "${df[i]} "; ((i > 5))&&((i% 6 == 0)) && dp="${df[i]:0:1}" && for i in $(seq ${dp}); 
do printf %b "\e[38;5;${dk[i]}m${o}"; done && for i in $(seq $((10 - dp))); do printf %b "${l}"; 
done && echo; done | sed -e 's/00%//g'|column --table --table-order 1,2,6,4,3,7,5 --table-hide 6,4,1; 
####
else 
####
for i in ${!df[*]}; do printf %b "${df[i]} "; ((i > 5))&&((i% 6 == 0)) && dp="${df[i]:0:1}" && for i in $(seq ${dp}); 
do printf %b "\e[38;5;${dk[i]}m${o}"; done && for i in $(seq $((10 - dp))); do printf %b "${l}"; 
done && echo; done | sed -e 's/00%//g'|column --table --table-order 1,2,6,4,3,7,5 --table-hide 6,4; 
####
fi | sed -e "1s/^/\x1b[0;2m/g" -e "s/$/\x1b[m/g" -e "s/\//\x1b[34m&\x1b[0m/g" -e "2,9s/[a-ln-z]/\x1b[33m&/g" -e "2,9s/[GM]/\x1b[2;95m&\x1b[m/g"; 
####
####
}; 
