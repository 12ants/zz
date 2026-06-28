#!/bin/bash
[ -n "$PREFIX" ] && termux-battery-status > "$HOME/logs/zz/b/battery.log"; 
####
cat ~/logs/zz/b/battery.log|grep -e "percentage"|tr -d 'A-z ,\":' > "$HOME/logs/zz/b/bp.log"; 
cat ~/logs/zz/b/battery.log|grep -e "CAPACITY"|tr -d '=A-z ,\":' >> "$HOME/logs/zz/b/bp.log"; 
####
if [ 0"$(cat $HOME/logs/zz/b/bp.log)" -lt 12 ]; then 
[ "$PREFIX" ] && termux-tts-speak -s SYSTEM "battery at $(cat $HOME/logs/zz/b/bp.log)%"; 
fi; 
####
####
# bat="$(
####
# bcolor="$(($(cat ~/logs/b/bp.log)/10*4+124-4)) | tee ~/logs/b/bcolor.log)"; 
###
# bcharge='\e[1;92m'; cat $HOME/logs/b/battery.log|grep -qe "DISCHARGING" 2>/dev/null && bcharge='\e[0;97m'; 
####
# printf %b '${bcharge}[\e[0m\e[${bcolor}m${bat}${bcharge}]\e[0m ' > $HOME/logs/b/bat.log; 
