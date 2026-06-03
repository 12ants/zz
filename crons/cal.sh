#!/bin/bash
#### getg g
calcomp() { printf -v "epoch" %b "$(($(date +%s) / 60))"; printf -v "epcal" %b "$(($(tail -c10 $HOME/logs/calendar.json) / 60))" 2>/dev/null; printf -v "epmin" %b "$((epoch - epcal))"; }; 
####
getcal() { (curl -sL "https://script.google.com/macros/s/AKfycbwSft4XmNq-lCW38uuBjihWM8pKMGrm-1uDmwusW7uksz0uN3WIEobzOt-0NQUgDOASqQ/exec" && printf %b "\nEPOCH_"; date +%s|tr -d "\n") > $HOME/logs/calendar.json; }; 
####
####
calstyle() { 
(cat $HOME/logs/calendar.json | tr -s "," "\n" | grep -vE 'EPOCH_|h_|description|end_date' | sed '/start_date_time/{s/.[0-9]*[-T]//g}' | cut -f1 -d "+" | sed -e "s/{\"summary/€\n/g"| cut -f 2- -d":" | tr -s "\n€[]" " \n"|sed -e 's/\ \"//g' -e 's/\"\ /\"/g' | col -xb | column --separator "\"" --table --output-separator " | " --table-columns "123456789012345678900" --table-right 1| tail -n+2 | bat -ppflr --theme Visual\ Studio\ Dark+ ) > $HOME/logs/cal.log; }; 
####
####
# [ -e "$HOME/logs/calendar.json" ] || getcal; 
####
####
####
[ -s "$HOME/logs/calendar.json" ] || getcal; 
cat $HOME/logs/calendar.json | grep -qe "EPOCH" || getcal; 
####
calcomp; [[ "$epmin" -gt "28" ]] && getcal; calcomp; 
####
#### get calendar
####
# (curl -sL "https://script.google.com/macros/s/AKfycbye8O0u3we9g5Xt3HilbKzLdjlC94OwSj7QPprmzc0pWI5dZ_ORE5YSaFmlyCJ-JqBQ/exec" && printf %b "\nEPOCH_$(date +%s)") > $HOME/logs/calendar.json && echo ok; 
