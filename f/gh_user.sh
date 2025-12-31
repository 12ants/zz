#!/bin/bash
function gh_user () { 
####
IFS=$'\n\t '; 
ghusers=($(gh auth status|col -xb|grep -e "Logged in"|cut -f9 -d" ")); 
uhw="$(printf %b "${ghusers[*]}"|wc --max-line-length)"; 
####
ghuser1="$(printf %b "${ghusers[*]}"|command fzf-tmux -h "$((${#ghusers[*]} +3))" -w "$((uhw + 6))")"; 
####
####
printf %b "\n"; 
gh auth switch -u "${ghuser1}"; 
printf %b "\n"; 
####
git config --global core.sshCommand "ssh -i ~/.ssh/gh_$ghuser1"; 
git config --list --global|bat -ppflc; 
####
}; 
