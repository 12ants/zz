#!/usr/bin/env bash
webshot() {
####
site="$1"; echo $site|grep -qv 'https' && https='https://'||https=''; 
####
echo; unset -v scfile 2>/dev/null; 
####
[ "$1" ]||read -rp 'site: ' -i 'https://' 'site'; 
####
time="$(date +%y%m%d%H%M%S)"; 
####
scfile="screenshot_${time}_${site}_.png"; 
####
curl -X POST "https://api.cloudflare.com/client/v4/accounts/${CF_ACCOUNT_ID}/browser-rendering/screenshot" -H "Authorization: Bearer ${CF_API_SH}"  -H 'Content-Type: application/json'  -d '{ "url": "'${https}${site}'" }' --output "${scfile}"; echo -e "\nscreenshot written to ${PWD}/${scfile}"; 
jp2a --colors -i ${scfile}; }; 
webshot
