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
if [ -e ~/.ssh/gh_$ghuser1 ]; then :; 
else ssh-keygen -N '' -f ~/.ssh/gh_$ghuser1; 
gh ssh-key add ~/.ssh/gh_${ghuser1}.pub; fi; 
####
git config --global core.sshCommand "ssh -i ~/.ssh/gh_$ghuser1"; 
git config --list --global|bat -ppflc; 
####
}; 
