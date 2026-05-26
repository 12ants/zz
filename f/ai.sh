#!/bin/bash
#### ok

ai() {
####
prompt="$*"; [ -z "$1" ] && return 0; 
####
(echo --------; date; printf %b "#### prompt: \n$prompt\n#### answer: \n") | tee -a ~/logs/ailog.log; 
####
curl -sL "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent" -H 'Content-Type: application/json' -H "X-goog-api-key: ${GOOGLE_API_KEY}" -X POST -d '{"contents": [ {"parts": [ {"text": "'"${prompt}"'" } ] } ] }'|sed -e "/thoughtSignature/d"|grep -e "text"|cut -f2- -d":"|sed -e "s/..$//" -e "s/^..//"|tee -a ~/logs/ailog.log; 
####
}; 




####
####
