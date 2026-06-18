aigpt() { 
export CEREBRAS_API_KEY="csk-9n2rxmrrvm4kmfmrjftewhvjw85x8yn2rmydype8cymd536r"; 

mm=lalalala; 

printf %b "
$(curl --location 'https://api.cerebras.ai/v1/chat/completions' \
--header 'Content-Type: application/json' \
--header "Authorization: Bearer ${CEREBRAS_API_KEY}" \
--data '{
  "model": "gpt-oss-120b",
  "stream": true,
  "messages": [{"content": "'"${mm}"'", "role": "user"}],
  "temperature": 0,
  "max_tokens": 4444,
  "reasoning_effort": "medium",
  "seed": 0,
  "top_p": 1
}')" | tee ~/logs/ai/${EPOCHSECONDS}.json; 
printf %b "\n____ >> \n~/logs/ai/${EPOCHSECONDS}.json\n"; 
}; 
