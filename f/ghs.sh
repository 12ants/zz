#!/usr/bin/env bash
## github searcher
ghs() { local IFS=$' \t\n'; unset -v FZF_DEFAULT_OPTS;  
ghs_folder="${HOME}/logs/tmp/ghs"; 
mkdir -pm 775 $ghs_folder 2>/dev/null; 
rm $ghs_folder/* 2>/dev/null; 
####
[ -z $1 ] && read -rep ' -- repo: ' "ghs" || ghs=($@); 

oo=($(gh search repos ${ghs[*]}|sed -e s/\\t/\ /g)); 

for i in ${oo[*]}; do 
printf %b "$i" > $tmp/ghs/$(printf %b "${i/\ */}"|sed -e 's/\//@/';); done; 
ghss=($(command ls -tr "${tmp}/ghs" | fzf -i -m --preview "clear; cat $ghs_folder/{}|sed -e 's/\ /\n--\n/'|bat -ppflzig" --preview-window '9,top,wrap' --bind 'q:abort' \
--cycle --info inline --border none; )); 
cd ~/gh; 
for a in ${ghss[*]}; do gh repo clone ${a/@//}; done; printf %b "\e[96m${ghss[*]/@//}\e[0m\n"; ls --color=always --classify -shG ${ghss[*]/*@/}; cd $ghss; pwd; ls; }; 
####
alias 12githubsearch='ghs'; 
