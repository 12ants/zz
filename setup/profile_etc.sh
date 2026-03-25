#!/bin/bash
## add global profile config
####
if [ "$GROUPS" = "1000" ]; then 
sudo touch "/etc/profile.d/zz.sh"; 
sudo chmod 775 "/etc/profile.d/zz.sh"; 
cat "/etc/profile.d/zz.sh" | grep -qe "export EDITOR=/bin/micro" || printf %b "\nexport EDITOR="'"/bin/micro"'"; \n" | sudo tee -a "/etc/profile.d/zz.sh"; 
cat "/etc/profile.d/zz.sh" | grep -qe "alias l='"'cd $(lf -print-last-dir)'"'" || printf %b "\nalias l='"'cd $(lf -print-last-dir)'"'\n" | sudo tee -a "/etc/profile.d/zz.sh"; 
####
[ -d "/etc/lf" ] || sudo mkdir "/etc/lf"; 
sudo rm /etc/lf/* 2>/dev/null; 
sudo ln -s /home/${SUDO_USER:-$USER}/zz/c/lf/* -t /etc/lf/; 
####
fi; 
####
printf %b "\nprofile_etc installed\n"; 
