#!/bin/bash
####
12calendar() { 
#### 
dott() { printf %b "\e[0m"; for i in $(seq ${1-45}); do printf %b "·"; done; printf %b "\e[0m"; }; 
####
calcomp() { printf -v "epoch" %b "$(($(date +%s) / 60))"; printf -v "epcal" %b "$(($(tail -c10 $HOME/logs/calendar.json) / 60))"; printf -v "epmin" %b "$((epoch - epcal))"; }; 
####
12getcal() { 
####
printf %b "\e[34G getting cal "; 
(curl -sL "https://script.google.com/macros/s/AKfycbye8O0u3we9g5Xt3HilbKzLdjlC94OwSj7QPprmzc0pWI5dZ_ORE5YSaFmlyCJ-JqBQ/exec" && printf %b "\nEPOCH_$(date +%s)") > $HOME/logs/calendar.json && printf %b "\e[G\e[K"; 
####
(cat $HOME/logs/calendar.json | tr -s "," "\n" | grep -vE 'EPOCH_|h_|description|end_date' | sed '/start_date_time/{s/.[0-9]*[-T]//g}' | cut -f1 -d "+" | sed -e "s/{\"summary/€\n/g"| cut -f 2- -d":" | tr -s "\n€[]" " \n"|sed -e 's/\ \"//g' -e 's/\"\ /\"/g' | col -xb | column --separator "\"" --table --output-separator " | " --table-columns "1234567890123456" --table-right 1 | tail -n+2 | bat -ppflr --theme Visual\ Studio\ Dark+ ) > $HOME/logs/cal.log; }; 
####
[ -e "$HOME/logs/calendar.json" ]||12getcal; 
####
calcomp; dott; printf %b "\e[G\e[2m${epmin} mins ago \e[0m"; 
[[ "$epmin" -gt "88" ]] && 12getcal; 
for i in {1..28}; do printf %b "·"; done; 
printf %b "\e[19G"; printf %b " $(date +%a\ %b\ %d\ %Y\ \|\ %T)"|bat -ppfljava --theme DarkNeon; echo; calcomp; 
####
[ -e $HOME/logs/calendar.json ] || 12getcal; cat  $HOME/logs/calendar.json|grep -e "EPOCH" --quiet || 12getcal; 
####
cat $HOME/logs/cal.log; dott; echo;
####
}; 
