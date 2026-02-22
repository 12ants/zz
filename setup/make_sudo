#!/bin/bash
## create super user froom root
# sus() { sudo $@; }; 
12sudoer() { 
local IFS=$'\n\t '; c2='\e[96m--\e[0m'; 
unalias sudo 2>/dev/null; unset sudo 2>/dev/null; 
sudo mkdir -pm 775 /home/${SUDO_USER:-$USER}/tmp 2>/dev/null; 
sudo chown ${SUDO_USER:-$USER}: /home/${SUDO_USER:-$USER}/tmp 2>/dev/null; 
# hash sudo 2>/dev/null && 

# if ((UID > 1)); then printf %b "\n $c2 \e[2m[\e[0m $0 \e[0m]\n $c2 run this as sudo\n\n\n\n"; 
# echo; [[ $0 =~ /*/ ]] && exit 1; 
# [[ $0 =~ -bash ]]||return 5 2>/dev/null; else 
echo;echo;echo;echo; 
printf %b "\e[K $c2 "; 
echo;echo;echo;echo; 
echo;echo;echo;echo; 
printf %b "\n\n\n\n\n\n\e[14A\e[K\n\e[K $c2 Add as sudo-user: "; 
read -ep ' ' -i "${SUDO_USER:-$USER}" "newsudo"; 
####
# sudo touch /etc/sudoers.d/${newsudo}_ss; 
# sudo chmod 775 /etc/sudoers.d/${newsudo}_ss; 
####
# sds=($(sudo touch /etc/sudoers.d/$newsudo 2>&1|sed -n "/\(error\|empty\)/p"|cut -f2 -d":")); 
# [ $sds ] && sudo sed $(for ss in ${sds[*]}; do printf %b "-e ${ss}d "; done) /etc/sudoers.d/$newsudo > /home/${SUDO_USER:-$USER}/tmp/$newsudo; 
# ####
# [ -s /home/${SUDO_USER:-$USER}/tmp/$newsudo ] || sudo cp /home/${SUDO_USER:-$USER}/tmp/$newsudo /etc/sudoers.d/$newsudo -b; 
####
echo;echo;echo;echo; 

# sudo echo "${newsudo} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$newsudo; 
# sudo echo "%${newsudo} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$newsudo; 

sudo echo "${newsudo} ALL=(ALL) NOPASSWD:ALL" > /home/${SUDO_USER:-$USER}/tmp/${newsudo}_ss; 
sudo echo "%${newsudo} ALL=(ALL) NOPASSWD:ALL" >> /home/${SUDO_USER:-$USER}/tmp/${newsudo}_ss; 
sudo cp -b /home/${SUDO_USER:-$USER}/tmp/${newsudo}_ss -t /etc/sudoers.d; 
printf %b "----\n"; 
sudo cat /etc/sudoers.d/${newsudo}_ss; 
printf %b "----\n"; 
sudo ls -1ptr /etc/sudoers.d/|grep --color=always -we "${newsudo}_ss" -C22; 
printf %b "\n\t ----\n"; 
printf %b "\t\e[7m DONE \e[0m"; 
printf %b "\n\t ----\n\n"; 
}; 
12sudoer; 
####
####
# sds=($(sudo touch /etc/sudoers.d/sudos.sh 2>&1|sed -n "/\(error\|empty\)/p"|cut -f2 -d":")); 
# [ $sds ] && sed $(for ss in ${sds[*]}; do 
# printf %b "-e ${ss}d "; done) /etc/sudoers.d/sudos.sh > $HOME/sudos.sh; 
# sudo cp $HOME/sudos.sh /etc/sudoers.d/sudos.sh -b; 
####
####
# sudo=""; 
####
####
####
