#!/bin/bash
## weather codes
zz.weather.smhi() { 
# local IFS=$'\n\t '; 
wc=(codes); wc[1]="Clear sky"; wc[2]="Nearly clear sky"; wc[3]="Variable cloudiness"; wc[4]="Halfclear sky"; wc[5]="Cloudy sky"; wc[6]="Overcast"; wc[7]="Fog"; wc[8]="Light rain showers"; wc[9]="Moderate rain showers"; wc[10]="Heavy rain showers"; wc[11]="Thunderstorm"; wc[12]="Light sleet showers"; wc[13]="Moderate sleet showers"; wc[14]="Heavy sleet showers"; wc[15]="Light snow showers"; wc[16]="Moderate snow showers"; wc[17]="Heavy snow showers"; wc[18]="Light rain"; wc[19]="Moderate rain"; wc[20]="Heavy rain"; wc[21]="Thunder"; wc[22]="Light sleet"; wc[23]="Moderate sleet"; wc[24]="Heavy sleet"; wc[25]="Light snowfall"; wc[26]="Moderate snowfall"; wc[27]="Heavy snowfall"; 
####
wcp[0]='No precipitation' wcp[1]='Rain' wcp[2]='Thunderstorm' wcp[3]='Freezing rain (i.e. supercooled raindrops which freeze on contact with the ground and other surfaces)' wcp[4]='Mixed/ice' wcp[5]='Snow' wcp[6]='Wet snow (i.e. snow particles which are starting to melt)' wcp[7]='Mixture of rain and snow' wcp[8]='Ice pellets' wcp[9]='Graupel' wcp[10]='Hail' wcp[11]='Drizzle' wcp[12]='Freezing drizzle (i.e. supercooled drizzle which freezes on contact with the ground and other surfaces)'; 
####
curl -sL "https://opendata-download-metfcst.smhi.se/api/category/snow1g/version/1/geotype/point/lon/16.158/lat/58.5812/data.json?timeseries=45?parameters=air_temperature,symbol_code,predominant_precipitation_type_at_surface" -o "$HOME/logs/wc.json"
##
IFS=$'\n' wttr=($(cat $HOME/logs/wc.json |tr -s "[]{}, " "\n"|tail -n+10|grep -vE "inter|data|time"|cut -f2- -d":"|tr "\n" "\n"|sed -e '3~3a_' -e "s/\.00//g" -e "1~3a\ \$\{wcp\[" -e "2~3a\ \$\{wc\["  -e "2~3s/$/\]\}\,\ /g" -e "3~3s/$/\]\}/g"|tr -d "\n"|tr -s "_" "\n")); 


# IFS=$'\n' wttr=($(cat $HOME/logs/wc.json |tr -s "[]{}, " "\n"|tail -n+10|grep -vE "inter|data|time"|cut -f2 -d":"|tr -s "\n" " "|sed -e 's/\.00/\n/g'|sed -e 's/^\ //g')); 
##
# eval $(kk=0; for i in ${!wttr[*]}; do kk=$((kk+3600)); date --date=@$(($(date +%s)+$kk)) +%h\|%d\ %R; printf %b "${wttr[i]}\n__\n"; done|tr -s "\n" " "|tr -s "_" "\n"|sed -e 's/^\ //g')|bat -ppflnim --theme Nord; 

eval $(kk=0; for i in ${!wttr[*]}; do kk=$((kk+3600)); date --date=@$(($(date +%s)+$kk)) +%h\|%d\ %R; printf %b "${wttr[i]}\n__\n"; done|tr -s "\n" " "|tr -s "_" "\n"|sed -e 's/^\ //g'|sed -e 's/^/echo\ \-e\ \"/g' -e 's/\ /\ \[/4' -e 's/\ /c\]\ /5' -e 's/.$/\";\ \n\n/g')|tee $HOME/logs/wc.log|bat -ppflnim --theme Nord; 
# |tee $HOME/logs/weather.log; 

alias wettr='\
gum style --border normal --padding "1 2" --margin 2 \
"$(head -n23 $HOME/logs/wc.log|cut -f 1- -d" "|sed -n "1~3s/$/\n/p"|bat -ppflnim --theme Nord)"'; 

##
};
# weather.paramaters() { 
#### 
# declare -a wcp[0]='No precipitation' wcp[1]='Rain' wcp[2]='Thunderstorm' wcp[3]='Freezing rain (i.e. supercooled raindrops which freeze on contact with the ground and other surfaces)' wcp[4]='Mixed/ice' wcp[5]='Snow' wcp[6]='Wet snow (i.e. snow particles which are starting to melt)' wcp[7]='Mixture of rain and snow' wcp[8]='Ice pellets' wcp[9]='Graupel' wcp[10]='Hail' wcp[11]='Drizzle' wcp[12]='Freezing drizzle (i.e. supercooled drizzle which freezes on contact with the ground and other surfaces)'; 
####
# }; 

# kk=0; for i in ${!wttr[*]}; do kk=$((kk+3600)); date --date=@$(($(date +%s)+$kk)) +%h\ %d\ \-\ %R; printf %b "${wttr[i]}\n__\n"; done|tr -s "\n" " "|tr -s "_" "\n"|sed -e 's/^\ //g'

# eval $(kk=0; for i in ${!wttr[*]}; do kk=$((kk+3600)); date --date=@$(($(date +%s)+$kk)) +%h\ %d\ \-\ %R; printf %b "${wttr[i]}\n__\n"; done|tr -s "\n" " "|tr -s "_" "\n"|sed -e 's/^\ //g'|sed -e 's/^/echo\ \-e\ \"/g' -e 's/\ /\ \$\{wc\[/7' -e 's/.$/\]\}\";\ \n\n/g'); 


# cat $HOME/logs/wc.json |tr -s "[]{}," "\n\"\n"|tail -n+10|grep -vE "inter|data"|sed -e "s/\:00\:00Z//g"|cut -f2- -d":"|sed -e "s/T/Twt[/g"|cut -f2 -d"T"|tr "\n\"" " _"|sed -e "s/_\ /]=(/g" -e "s/\.00 /);\n/g"; 
