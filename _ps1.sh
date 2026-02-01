#!/bin/bash 
################
mkdir $HOME/logs/b -p -m 775 2>/dev/null; 
[ "$PREFIX" ] && . "${HOME}"/zz/crons/bat.sh & disown; 
# [ "$PREFIX" ] &&
touch $HOME/logs/b/battery.log; 
touch $HOME/logs/b/bp.log; 
chmod 775 $HOME/logs/b/bp.log; 
yellow='\e[93m'; cyan='\e[96m'; re='\e[0;2m'; bc=0; dim='\e[2m'; 
##
wlan="$(cat "$HOME/logs/iploc.log" 2>/dev/null)"; 
################
_bat() { 
if [ "$PREFIX" ]; then 
printf -v "batstat" %b "$HOME/logs/b/battery.log"; 
printf -v "batcap" %b "$HOME/logs/b/bp.log"; 
else 
####
if [ -e "/sys/class/power_supply/battery/status" ]; then 
printf -v "batstat" "/sys/class/power_supply/battery/status"; 
printf -v "batcap" "/sys/class/power_supply/battery/capacity"; 
elif [ -e "/sys/class/power_supply/BAT0/status" ]; then 
printf -v "batstat" "/sys/class/power_supply/BAT0/status"; 
printf -v "batcap" "/sys/class/power_supply/BAT0/capacity"; 
elif [ -e "/sys/class/power_supply/BAT1/status" ]; then 
printf -v "batstat" "/sys/class/power_supply/BAT1/status"; 
printf -v "batcap" "/sys/class/power_supply/BAT1/capacity"; 
else unset -v batcap batstat; 
fi; fi; 
####
if [ -e "$batcap" ]; then 
[ -z "$PREFIX" ] && cat $batcap > "$HOME/logs/b/bp.log"; 
[ -z "$PREFIX" ] && cat $batstat > "$HOME/logs/b/battery.log"; 
batp="$(cat $batcap)" && grep -wqi "Charging" "$batstat" && \
bcharge="\e[0m\e[38;5;42;1m" || bcharge="\e[0m\e[2m"; 
bcolor="$(printf %b "$((batp / 10 * 4 + 124 - 4))"|tee ~/logs/b/bcolor.log)"; 
[ -e "$batcap" ] && printf %b "${bcharge}[${re}\e[38;5;${bcolor}m${batp}${bcharge}]$re"; fi; 
####
}; 
################
# [[ "$HOSTNAME" == "localhost" ]] && unset HOSTNAME || \
if [ "$(hostname)" = localhost ]; then printf -v "_host" %b "[\e[95m${HOSTTYPE}${re}]"; 
else printf -v "_host" %b "[\e[95m${HOSTNAME}${re}]"; fi; 
################
_dtime() { hh=1$(date +%H;); mm=1$(date +%M;); ss=1$(date +%S); 
printf %b "\e[38;5;$((hh + 22))m${hh:1:2}$re:\e[38;5;$((mm + 22))m${mm:1:2}$re:\e[38;5;${ss/0/1}m${ss:1:2}\e[0m" 2>/dev/null; }; 
# _etime() { printf %b "\e[38;5;${EPOCHSECONDS:8:2}m${EPOCHSECONDS:6:4}\e[0m";  }; 
################
_gits() { [ -e $PWD/.git ] && ggii="$(git status --short 2>/dev/null|grep "" --quiet && printf %b "41"||printf %b "44"; )" && printf %b "\e[0m\e[${ggii}m git \e[0;2m"; }; 
ee() { [ $? = 130 ] && echo gg; }; 

_gitsu() { [ -s "$HOME/logs/gh_log.log" ] && printf %b "[\e[92m$(cat $HOME/logs/gh_log.log)\e[0;2m]"; }; 
wip() { [ -s "$HOME/logs/idc.log" ] && printf %b "[\e[96m$(cat $HOME/logs/idc.log|cut -f1 -d" ")$\e[0;2m]"; }; 
cc1="$(cat $HOME/logs/idc.log|cut -f1 -d" ")"; 
cc2="$(cat $HOME/logs/idc.log|cut -f3 -d" ")"; 
#alias gitstat='git status --short 2>/dev/null|tr "\n\t " " | "|bat -ppfld --theme Coldark-Dark'; 
# (printf %b "${gitst}\t
################
# . "$HOME//i/colors.sh"; 
################
# \e[0;2m'${wlan%.*}'.\e[0;1m'${w[${wlan/*./}]}'${wlan/*./}
# st() { st=$?; [ $st = 130 ] && printf %b "\e[2A\r"; return $st; }; 
################
# trap 'printf %b "\e[K\e[2A\e[K"' 2; 
##
# ['$re'$(_etime)'$re']\
# ['$re${w[${wlan/*./}]}'\e[3${c[idn]:13:1}m\e[48;5;${c[idn]:0:4}${model:0:12}'$re']\
# ['$re'\e[38;5;${cc1}m${wlan}'$re']\
((UID == 0)) && id='\e[1;101;97;5mROOT\e[0m'||id='\e[96m\u\e[0m'
PS1='\e[0m\e[2m[\e[0;1;38;5;$((2 + $?))m$?'$re']\
$(_gits||printf "")\
['$re'$(_dtime 2>/dev/null)'$re']\
'$re'$(_bat)\
'$re'$(_gitsu)\
['$re'\e[0;48;5;${cc1};38;5;${cc2}m${model:0:12}'$re']\
['$id']'$re''${_host}'['$re$yellow'\w'${re}]'\e[?25h\e[0m \n'; 
