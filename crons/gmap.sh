#!/bin/bash 
##
gmap () { 
##
export GMAP="AIzaSyA_4mqNFG-6Ghc6T1jsvoBNvsjv7RVwO8E"; 
logf="${HOME}/logs/g"; mkdir -p $logf 2>/dev/null; touch ${logf}/g$(date +%m).json; 
(echo -e "----------"; 
date|tr -d "\n"; )|tee -a ${logf}/g$(date +%m).json; 
##
for net in "network" "gps" "passive"; do ee=""; ee="$(termux-location -p ${net} -r last | grep -E 'latitude|longitude' | tr -d "a-z\;\"\ \n"|sed -e "s/\://g" -e "s/.$/\n/g")"; 
[ "${ee}" ] && llll+=("${ee}" ); done; 
##
##
echo -ne " [$llll]"|tee -a ${logf}/g$(date +%m).json; 
##
##
ll=($(printf %b "${llll[*]}"|sed "/^$/d"|sort -u)); 
for map in ${ll[*]}; do echo; curl -s "https://maps.googleapis.com/maps/api/geocode/json?latlng=${map}&key=${GMAP}"|grep -e 'formatted_address' -m5|cut -f4 -d'"'; done|sort -u|tee -a ${logf}/g$(date +%m).json; 
##
##
}; 
##
##
gmap; 
# tail ${logf}/g$(date +%m).json | termux-notification; 
