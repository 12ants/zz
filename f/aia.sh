#!/bin/bash
## free ai
ai() { 
folder="${HOME}/logs/ai"; mkdir -p ${folder} 2>/dev/null; 
####
printf %b "\e[0;2m https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent
\e[0m\n\e[5m >\e[0;2m_\e[0;1;5m< \e[0m\n\n\n\n\n\n\e[4A"; 
####
[ "$1" ] && prompt="$*" || read -re "prompt"; 
[ "$prompt" ] || return 6; 
####
out="$(printf %b "${prompt}"|grep -oi '[0-9, ,a-z]'|tr -d "\n"|tr -s " " "_")-$(date +%H%M%S)"; 
out="${folder}/${out}.md"; 
printf %b "# ${prompt}\n----\n" | tee "${out}"; 
####
####
G_API_KEY="$GOOGLE_API_KEY"; 
hash qmenu 2>/dev/null && qmenu "api key" "GOOGLE_API_KEY GEMINI_API_KEY" && G_API_KEY="${sel}"; 
####
printf %b "$(curl -sL "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent" -H 'Content-Type: application/json' -H "X-goog-api-key: ${G_API_KEY}" -X POST -d '{"contents": [ {"parts": [ {"text": "'"${prompt}"'" } ] } ] }' | grep --color=never '"text": ')" | sed -e "/\"text\":\ ./d"  -e "s/\"\,$/\n/" | tee -a "${out}" | bat -pflmd; }; 
# || rm ${out} || echo no answer || return 2; 
# };
####
####
#out=${prompt//[\,\\?\-\[\]\'\&\#\:\;\*\<\>\(\)\/\´\`\!\{\}\"\]/}; 
