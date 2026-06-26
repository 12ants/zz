#!/usr/bin/env bash
## log in to github
IFS=$' \n\t'; 
cols="$(($(stty size|cut -f2 -d' ')-2))"; 
gh_login="12ants"; c2='\t\e[96m--\e[0m'; g2='\t\e[92m>\e[0m'; 
mkdir ${HOME}/.safe 2>/dev/null; 
hash sudo 2>/dev/null && sudo="sudo"; 
hash gh 2>/dev/null || $sudo apt install gh; 
hash git 2>/dev/null || $sudo apt install git; 
hash openssl 2>/dev/null || $sudo apt install openssl; 
hash gpg 2>/dev/null || $sudo apt install gnupg; 
####
gh_user="$(id -nu)"; gh_mail="$(id -nu)@$(hostname)"; 
####
git config --global user.name $gh_user; 
git config --global user.email $gh_mail; 
git config --global init.defaultBranch main; 
####
printf %b "\n\e[0m-\e[${cols}b\n\n$c2 logging in to github ...\n\n\n\n\n\n\n\n\n\e[9A"; 
####
#### get pw - if none 
if [ -e "${HOME}/.safe/pw.sh" ]; then :; else 
printf %b "$c2 pw: "; read -erp "pw"; 
printf %b "${pw}" > "${HOME}/.safe/pw.sh"; fi; 
####
####
gpg --pinentry-mode loopback --passphrase-file ${HOME}/.safe/pw.sh -qd ${HOME}/zz/setup/gpg/gh_12ants.txt.gpg > ${HOME}/.safe/gh_12ants.txt; 
####
echo; 
gh auth login --with-token < ${HOME}/.safe/gh_12ants.txt; 
printf %b "\t"; 
gh auth switch -u 12ants; 
####
if [ -e "${HOME}/.ssh/id_ed25519.pub" ]; then echo; 
else ssh-keygen -N '' -f ${HOME}/.ssh/id_ed25519; fi; 
####
printf %b "\e[A\e[G\t"; 
gh ssh-key add ${HOME}/.ssh/id_ed25519.pub; 
printf %b ""; 
gh config set git_protocol ssh;  
####
printf %b "\t\e[34m>\e[0m "; 
ssh -T git@github.com -i ${HOME}/.ssh/id_ed25519; [ "$?" -lt 2 ] && printf %b "\e[A\e[G$g2\n"; 
####
printf %b "$c2 done!\n\n-\e[${cols}b\n"; 
####
