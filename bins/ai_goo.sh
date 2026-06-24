#!/usr/bin/env bash

ai_goo () { 
####
####
in="0"; unset idv1; 
while :; do 



input="$*"; [ -z "$input" ] && printf %b "_ input $((in++)): \n\n\e[A"; read -re "input"; 
####
####
if [ -z "${idv1}" ]; then 


resp=$(curl -s -X POST "https://generativelanguage.googleapis.com/v1beta/interactions" \
  -H "x-goog-api-key: $GEMINI_API_KEY" \
  -H 'Content-Type: application/json' \
  -H "Api-Revision: 2026-05-20" \
  -d '{
    "model": "gemini-3.5-flash",
    "input": "${input}",
  }')
####
idv1="$(printf %b "${resp//\"\,\"/\\n__\"}"|grep '"id"'|cut -f4 -d '"'|head -n1)"; text="$(printf %b "${resp//\"\,\"/\\n__\"}"|grep '"text"'|cut -f4 -d '"'|head -n1)"; 
####
####

else 
printf %b "_ input $((in++)): \n\n\e[A"; read -re "input"; 
resp=$(curl -X POST "https://generativelanguage.googleapis.com/v1beta/interactions" \
  -H "x-goog-api-key: $GEMINI_API_KEY" \
  -H 'Content-Type: application/json' \
  -H "Api-Revision: 2026-05-20" \
  -d '{
    "model": "gemini-3.5-flash",
    "input": "${input}",
    "previous_interaction_id": "'${idv1}'"
  }'; ); 

idv1="$(printf %b "${resp//\"\,\"/\\n__\"}"|grep '"id"'|cut -f4 -d '"'|head -n1)"; text="$(printf %b "${resp//\"\,\"/\\n__\"}"|grep '"text"'|cut -f4 -d '"'|head -n1)"; 

printf %b "\n${pompt}\n${text}\n\n" | tee -a ${HOME}/logs/$EPOCHSECONDS.md; fi; 


done; 


####
}; 


ai_goo
