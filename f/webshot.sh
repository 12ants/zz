webshot() {
site="$1"; 
echo; [ "$1" ]||read -ep 'site: ' -i 'https://' 'site'; 
time="$(date +%y%m%d%H%M%S)"; 
curl -X POST "https://api.cloudflare.com/client/v4/accounts/${CF_ACCOUNT_ID}/browser-rendering/screenshot" -H "Authorization: Bearer ${CF_API_SH}" -H 'Content-Type: application/json' -d '{ "url": "${site}'  --output "screenshot${time}_${site}.png"; echo -e "\nscreenshot written to ${PWD}/screenshot_${time}_${site}.png"; jp2a --colors --fill "${PWD}/screenshot_${time}_${site}.png" 2>/dev/null; }; 
