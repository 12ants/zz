#!/bin/bash
#### ok
function ai () { printf %b "\n\n\e[A"; mkdir -p ~/logs/ai 2>dev/null; time="$(date +%T)"; prompt="$*"; [ -z "$1" ] && (echo "ai: "; read -e "prompt"); ( echo --------; date; printf %b "#### prompt: \n$prompt\n#### answer: \n" ) | tee -a ~/logs/ailog.log; printf %b "$(curl -sL "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent" -H 'Content-Type: application/json' -H "X-goog-api-key: ${GOOGLE_API_KEY}" -X POST -d '{"contents": [ {"parts": [ {"text": "'"${prompt}"'" } ] } ] }' )" | grep -E '"text"|"modelVersion"|"message"' | tac|cut -f2- -d":" | sed -e "3s/..$//" -e "3s/^..//"|tee -a ~/logs/ai/ai_${time}_.md|bat -pflmd; };




####
####
