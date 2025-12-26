#!/bin/bash
## install figzz
uu="$(id -un)"; 
hash sudo 2>/dev/null && sudo=sudo; 
hash figlet 2>/dev/null || $sudo apt install -y figlet; 
$sudo mv ${PREFIX-/usr}/share/figlet $HOME/tmp/figlet2 -b 2>/dev/null; 
$sudo mkdir -pm 775 ${PREFIX-/usr}/share/figlet; 
$sudo chmod 775 ${PREFIX-/usr}/share/figlet; 
$sudo ln -s $HOME/zz/c/figlet/fonts/* -t ${PREFIX-/usr}/share/figlet 2>/dev/null; 
printf %b "\n figs installed\n"; 
# $sudo mkdir ${PREFIX-/usr}/share 2>/dev/null; 
