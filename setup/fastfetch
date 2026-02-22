#!/bin/bash
## install fastfetch 
mkdir ~/gh 2>/dev/null; 
git clone https://github.com/fastfetch-cli/fastfetch.git; 
cd ~/gh/fastfetch; 
git config set remote.origin.url "git@github.com:fastfetch-cli/fastfetch.git"; 
echo run; 
. run.sh; 
$sudo ln -s /home/$SUDO_USER/gh/build/fastfetch -t /bin/; 
echo gg; 
cd $OLDPWD; 
##
##
