# Encode the local file to base64 
suma() { 
[ -z "$GEMINI_API_KEY" ] && printf %b "\nget GEMINI_API_KEY\n" && return 0; 
mkdir -p ${HOME}/logs/ai 2>/dev/null; 
local IFS=$' \n\t'; 
inp="$*"; [ -z "$inp" ]&& inp="$(ls -1|fzf --preview-window 'right,50%' --preview 'ls -sh {}; echo --; bat -ppf {}' --header=' [ choose text to summarize ] ')" || return 0;  
time="$(date +%y%m%d_%H%M%S)"; 
out="${HOME}/logs/ai/ai_answer_${time}.md"; 
touch "${out}"; 
suma="$(base64 -w 0 ${inp})"; 
####
printf %b "$(curl -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.5-flash:generateContent" -H "x-goog-api-key: ${GEMINI_API_KEY}" -H 'Content-Type: application/json' -d '{ "contents": [ { "parts": [ {"text": "Summarize this document"} ] }, { "parts": [ { "inlineData": { "mimeType": "text/plain", "data": "'"${suma}"'" } } ] } ] }'|grep -e '"text": ')"|sed -e "s/\"text\":\ ./\r${inp}\n/" -e "s/\"\,$/\n/"|tee ${out}|bat -pflmd; 
printf %b "\nsaved response to: $out\n\n"; 
}; 
