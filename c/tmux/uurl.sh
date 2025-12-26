function urla () { 

unset -v uhl; 

url=($(for i in $(tmux list-panes|cut -c1); 
do tmux capture-pane -Jpt$i; done | grep -oE '(http|https?):\/\/.*[^>]' 2> /dev/null || return 1)) || return 0; 

local IFS=$'\n'; 

[ $url ] && uurl=($(printf %b "${url[*]}" |tr -s " ;\"\'" "\n"|grep -E "http*"|uniq)); 

uhl="$(printf %b "${uurl[*]}"|wc -l)"; 
uh=$(printf %b "${uurl[*]}"|wc --max-line-length); 

urla=($(printf %b "${uurl[*]}" | \
fzf-tmux -w "$((uh + 6))" -h "$((uhl + 4))" --disabled --info inline:" kk " --bind 'enter:print-query,q:abort,focus:replace-query')) || return 0; 
printf %b "\n${urla[*]}\n"; 


apps=(links wget lynx xdg-open yt-dlp echo termux-open-url); 
uhl="$(printf %b "${apps[*]}"|wc -l)"; 
uh=$(printf %b "${apps[*]}"|wc --max-line-length); 
apen="$(printf %b "${apps[*]}"|fzf-tmux -w "$((uh + 6))" -h "$((uhl + 4))" --disabled --info inline:" kk " --bind 'enter:print-query,q:abort,focus:replace-query')" && ${apen} ${urla}; 
# || return 0; 


#xdg-open $urla || termux-open-url $urla; 

}; 
urla; 
