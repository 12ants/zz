#!/bin/bash
function plusco () { 
local IFS=$'\n\t '; 
tty=$(tty); 
ls=($(command ls -1p)); 
uhl="$(printf %b "${ls[*]}"|wc -l)"; 
uh=$(printf %b "${ls[*]}"|wc --max-line-length); 
ll="$(ls -1p|fzf-tmux -w "$((uh + 6))" -h "$((uhl + 4))" --disabled --info inline:" kk " --bind 'enter:print-query,q:abort,focus:replace-query')";
 # | tee $tty || return 0;
tmux set-buffer "$ll"; 
tmux paste-buffer; 
# printf %b "${ll}" |tee $tty; 
# printf %b ""
}; 
plusco; 

# 
# unset -v uhl; 
# 
# url=($(for i in $(tmux list-panes|cut -c1); 
# do tmux capture-pane -Jpt$i; done | grep -oE '(http|https?):\/\/.*[^>]' 2> /dev/null || return 1)) || return 0; 
# 
# local IFS=$'\n\t '; 
# 
# [ $url ] && uurl=($(printf %b "${url[*]}" |tr -s " ;\"\'" "\n"|grep -E "http*"|uniq)); 
# 
# uhl="$(printf %b "${uurl[*]}"|wc -l)"; 
# uh=$(printf %b "${uurl[*]}"|wc --max-line-length); 
# urla=($(printf %b "${uurl[*]}" | \
# fzf-tmux -w "$((uh + 6))" -h "$((uhl + 4))" --disabled --info inline:" kk " --bind 'enter:print-query,q:abort,focus:replace-query')) || return 0; 
# printf %b "\n${urla[*]}\n"; 
# apps=(xdg-open links wget lynx yt-dlp echo termux-open-url); 
# uhl="$(printf %b "${apps[*]}"|wc -l)"; 
# uh=$(printf %b "${apps[*]}"|wc --max-line-length); 
# apen="$(printf %b "${apps[*]}"|fzf-tmux -w "$((uh + 6))" -h "$((uhl + 4))" --disabled --info inline:" kk " --bind 'enter:print-query,q:abort,focus:replace-query')" && ${apen} ${urla}; 
# # || return 0; 
# 
# 
# #xdg-open $urla || termux-open-url $urla; 
