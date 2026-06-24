#!/usr/bin/env bash
hihi () { 
local IFS=$' \n\t'; 
unset -v HISTTIMEFORMAT 2>/dev/null; 
local HISTTIMEFORMAT="%y%m%d-%H:%M:%S_"; 
date="$(date +%y%m%d-%H%M%S_)"; 
mkdir ~/logs/h -p 2>/dev/null; 
####
history|tac|cut -f 2- -d "_" | fzf --no-unicode --color 'fg:7' --style 'minimal' --border none --wrap --wrap-sign='' --bind "q:abort,backward-eof:abort,0:toggle-preview,change:first,focus:transform-prompt:printf %b '{n} > '" --header-first --tmux '100%,98%' --delimiter="_" --with-nth "{1..}" --no-preview --accept-nth "{1..}" > ~/logs/h/${date}.log; 
####
####
if [ -s ~/logs/h/${date}.log ]; then 
printf %b "\e[96m-\e[222b\e[0m\n"; 
history -sp ""; 
read -eri "$(cat ~/logs/h/${date}.log)" "kk"; 
eval "$kk"; history -ps "$(cat ~/logs/h/${date}.log)"; 
else rm ~/logs/h/${date}.log; fi; 
####
}; 
hihi
