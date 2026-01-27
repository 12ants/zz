#!/bin/bash
#### hello
hello=hello; 
declare -a list=($(ls));
line="$((${#line[*]} - 4 + $LINES))";
####
keyp() { 
a=1; 
while read -rsn1 k; do case $k in 
A) [ $a -gt 0 ] && printf %b "\e[A\e[G$((a--))";; 
B) [ $a -lt $line ] && printf %b "\e[B\e[G$((a++))";; 
q) break;; esac; done; }; 
####
printf %b "\e[K\n\e[K-\e[12b $hello -\e[12b\n\e[K"; 
## clear lines and go up
for i in $(seq $line); do printf %b "\n\e[K"; done; printf %b "\e[${line}A"; 
## print options
for i in ${!list[*]}; do if [ $((i + 6)) -gt $LINES ]; 
then break; fi; printf %b "   ${list[i]}\n"; done; 
####

#### end 
printf %b "-\e[12b $hello -\e[12b\n\n\e[${line}A\e[96m x\e[0m\e[2G"; keyp; 

	
