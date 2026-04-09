screenshot_web() { 
hash chromium || $sudo apt -y install chromium-browser; 
hash chafa || $sudo apt -y install chafa; 
hash convert || $sudo apt install -y ffmpeg imagemagick; 

printf $b "\n\n\n\n\e[4A\n"; 

if [ $1 ]; then

websc='${*}'; printf %b "${websc}" | grep -E 'http://|https://' || websc="https://${websc}"; 

else printf %b '\e[96m -- \e[0mwebsite to screenshot:' 
read -ep " " -i "https://" "websc"; 
fi; 
webcl="$(echo $websc|tr -d "/:\ ")"; 
mkdir $HOME/tmp 2>/dev/null; 
cd $HOME/tmp; 
date="$(date +%y%m%d_%H_%M_%S)"; 
chromium --headless --screenshot --window-size=1920,1080 --timeout=5000 "${websc}" 2>/dev/null && convert $HOME/tmp/screenshot.png $HOME/tmp/${webcl}_wide_${date}.jpg; 
chromium --headless --screenshot --window-size=580,1080 --timeout=5000 "${websc}" 2>/dev/null && convert $HOME/tmp/screenshot.png $HOME/tmp/${webcl}_tall_${date}.jpg; 

mediainfo $HOME/tmp/${webcl}_tall_${date}.jpg; 
chafa --format symbols $HOME/tmp/${webcl}_tall_${date}.jpg; 
mediainfo $HOME/tmp/${webcl}_wide_${date}.jpg; 
chafa --format symbols $HOME/tmp/${webcl}_wide_${date}.jpg; 

cd $OLDPWD; 

}; 
