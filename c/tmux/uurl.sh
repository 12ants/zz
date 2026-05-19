#!/bin/bash
unset -f urla 2>/dev/null; 
function urla () { 
unset -v uhl; 
IFS=$' \n'; 
url=($(for i in $(tmux list-panes|cut -c1); 
do tmux capture-pane -Jpt$i; done | grep -oE '(http|https?):\/\/.*[^>]' 2> /dev/null || return 1)) || return 0; 
[ $url ] && uurl=($(printf %b "${url[*]}" |tr -s " ;\"\'" "\n"|grep -E "http*"|uniq)); 
uhl="$(printf %b "${uurl[*]}"|wc -l)"; 
uh=$(printf %b "${uurl[*]}"|wc --max-line-length); 
urla=($(printf %b "${uurl[*]}"|fzf "$((uhl + 4))" --disabled --bind 'enter:print-query,q:abort,focus:replace-query'  --no-unicode --color 'bg:1,fg+:2'))|| return 0; 
printf %b "\n${urla[*]}\n"; 
apps=(xdg-open links wget lynx yt-dlp echo termux-open-url); 
uhl="$(printf %b "${apps[*]}"|wc -l)"; 
uh="$(printf %b "${apps[*]}"|wc --max-line-length)"; 
apen="$(printf %b "${apps[*]}"|fzf --color='bg:4,fg:1,fg+:2' --height "$((uh + 6))" --disabled --info inline:" kk " --bind 'enter:print-query,q:abort,focus:replace-query')" && ${apen} ${urla}; 

# || return 0; 


#xdg-open $urla || termux-open-url $urla; 

}; 
####
echo -e "$urla $uh $uhl $url $apen"; 

urla; 
#urla; 
echo -e "$urla uh:$uh uhl:$uhl url:$url $apen"; 
#IFS=$' \n'; 
for i in ${url[*]}; do printf %b "$i\n"; done|fzf --bind "q:abort" --color "bg:1,fg:2,bg+:0" --height "$((uhl + 4))"; 
#|fzf --bind 'q:abort' --delimiter=' ' --tmux 
read -srn1|| exit && exit; 
