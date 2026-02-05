#!/bin/bash
IFS=$'\n'; ddf=($(df -h | grep -E "sdcard|storage"))
########
for i in ${!ddf[*]}; do dp="$(($(printf %b "${ddf[i]}"|grep -o '\w*%'|tr -d '%')/10))"; printf %b "${ddf[i]} "; for o in $(seq $dp); do printf %b "#"; done; printf %b "\e[2m"; for o in $(seq $((10-dp))); do printf %b "#"; done; printf %b "\e[0m\n"; done > ~/logs/df.log; 
########
column --table --table-order 1,6,5,2,4,7,3 --table-hide 5 --table-truncate 1,6 --output-width $((COLUMNS*4/5))  ~/logs/df.log|bat -ppfljava
########
########
IFS=$' \n\t'; 
