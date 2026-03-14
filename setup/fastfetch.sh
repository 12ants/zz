#!/bin/bash
## install fastfetch 
oldp="$PWD"; 
mkdir ~/gh 2>/dev/null; cd ~/gh
git clone https://github.com/fastfetch-cli/fastfetch.git; 
cd ~/gh/fastfetch; 
git config set remote.origin.url "git@github.com:fastfetch-cli/fastfetch.git"; 
echo run; 
. run.sh; 
ln -s ${HOME}/gh/build/fastfetch -t /bin/; 
echo gg; 
cd $oldp; 
##
##
