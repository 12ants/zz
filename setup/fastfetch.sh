#!/bin/bash
## install fastfetch 
if [ "$PREFIX" ]; then apt install fastfetch; 
else sudo=sudo; 
oldp="$PWD"; 
mkdir ~/gh 2>/dev/null; cd ~/gh
git clone https://github.com/fastfetch-cli/fastfetch.git; 
cd ~/gh/fastfetch; 
git config set remote.origin.url "git@github.com:fastfetch-cli/fastfetch.git"; 
echo run; 
. run.sh; 
$sudo ln -s ${HOME}/gh/fastfetch/build/fastfetch -t /bin/; 
echo gg; 
cd $oldp; 
fi; 
##
##
