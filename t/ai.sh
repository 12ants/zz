#!/bin/bash
#### ok
function ai () { 
#!/bin/bash
###########
###########
local IFS=$' \n\t'; 
printf %b "\n\n\e[A"; mkdir -p ~/logs/ai 2>/dev/null; time="$(date +%T)"; prompt="$*"; [ -z "$1" ] && (echo -n "ai: "; read -e "prompt"); ( echo --------; date; printf %b "#### prompt: \n$prompt\n#### answer: \n" ) | tee -a ~/logs/ailog.log; 
####
printf %b "$(curl -sL "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent" -H 'Content-Type: application/json' -H "X-goog-api-key: ${GOOGLE_API_KEY}" -X POST -d '{"contents": [ {"parts": [ {"text": "'"${prompt}"'" } ] } ] }' )" \
| grep -E '"text"|"modelVersion"|"message"' | tac|cut -f2- -d":" | sed -e "3s/..$//" -e "3s/^..//"|tee -a ~/logs/ai/ai_${time}_.md|bat -pflmd; 
####
};



ai_ () {
#!/bin/bash
###########
###########
local IFS=$' \n\t'; 
printf %b "\n\n\e[A"; mkdir -p ~/logs/ai 2>/dev/null; time="$(date +%T)"; 
prompt="$*"; if [ -z "$1" ]; then echo -n "ai: "; read -re "prompt"; 
fi; printf %b "$(date)\n#### prompt: \n$prompt\n#### answer: \n" | tee -a ~/logs/ailog.log; 
####
prompt="$(printf %b "$prompt"|tr -s " " "+")"; 
printf %b "$(curl -sL "https://openrouter.ai/api/v1/chat/completions" -H "Authorization: Bearer $OPENROUTER_API_KEY" -H "Content-Type: application/json" -d '{"model": "openrouter/free","messages": [{"role": "user", "content": "'"${prompt}"'"}]}')" | jq | tee -a ~/logs/ai/ai_${time}_.md|bat -pfljson|grep -E '(model|content)' -C2|cut -f2- -d":"; }; 
# |tee -a ${HOME}/logs/ai_.json; 
