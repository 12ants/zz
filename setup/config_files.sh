#!/bin/bash
## install config-files 
[ -z "$start" ] && start="$HOME/zz"; 
####
mkdir $HOME/tmp 2>/dev/null; 
mkdir $HOME/tmp/zz_old 2>/dev/null; 
mkdir $HOME/.config 2>/dev/null; 
####
hash sudo 2>/dev/null && [ "$UID" != "0" ] && sudo="sudo"; 
####
c2='\e[0m\e[36m --\e[0m'; qq="160"; mkdir ~/.config 2>/dev/null; 
####
p1() { p2=" ${@}"; for i in $(seq ${#p2}); do sleep ${sl-.05}; printf %b "${p2:${i}:1}"; done; }; 
####
printf %b "\n$c2 "; p1 "installing config files ..."; echo; 
printf %b "\n$c2 "; . $start/setup/gpg.sh;  
##
hash bat &>/dev/null || $sudo apt install -y bat &>/dev/null; 
hash batcat &>/dev/null || $sudo apt install -y batcat &>/dev/null; 
##
$sudo ln -s ${PREFIX}/bin/bat ${PREFIX}/bin/batcat &>/dev/null; 
$sudo ln -s ${PREFIX}/bin/batcat ${PREFIX}/bin/bat &>/dev/null; 
##
ln -s $start/c/inputrc $HOME/.inputrc --backup --suffix="_bu__$(date +%y%m%d_%H%M%S)"; 
ln -s $start/c/lesskey $start/c/*.conf -t $HOME/.config --backup --suffix="_bu__$(date +%y%m%d_%H%M%S)"; 
##
linkfolders=($(command ls -1p $start/c/link|grep "/")); 
for q in ${linkfolders[*]}; do 
mkdir $HOME/.config/$q 2>/dev/null; 
mv $HOME/.config/$q/* -t $HOME/tmp/zz -b --suffix="_bu__$(date +%y%m%d_%H%M%S)" 2>/dev/null; 
ln -s $start/c/link/$q/* -t $HOME/.config/$q/ -r --backup --suffix="_bu__$(date +%y%m%d_%H%M%S)"; 
# sleep .05; 
printf %b "\n\e[0m"; echo "updated"; printf %b "\e[38;5;$((qq++))m $q"; 
done; 
####
copyfolders=($(command ls -1p $start/c/copy|grep "/")); 
for q in ${copyfolders[*]}; do 
mkdir $HOME/.config/$q 2>/dev/null; 
mv $HOME/.config/$q/* -t $HOME/tmp/zz -b --suffix="_bu__$(date +%y%m%d_%H%M%S)" 2>/dev/null; 
cp -b $start/c/copy/$q/* -t $HOME/.config/$q/ -r --backup --suffix="_bu__$(date +%y%m%d_%H%M%S)"; 
# sleep .05; 
printf %b "\n\e[0m"; echo "updated"; printf %b "\e[38;5;$((qq++))m $q"; 
done; 

####

[ $PREFIX ] && linksf="$HOME/.links" || linksf="$HOME/.links2"; 
mkdir $linksf 2>/dev/null; 
ln -s $start/c/links2/* -t $linksf --backup; 

mkdir $HOME/bin 2>/dev/null; 
ln -s $start/c/ssss.sh $HOME/bin/ssss.sh 2>/dev/null; 

printf %b "${PATH}:${HOME}/.local/bin:${HOME}/bin" > $HOME/.config/path.sh; 
chmod 775 $HOME/.config/path.sh; 
printf %b "\n\e[0m\n"; 
p1 'added PATH to ~/.config/path.sh '; 
printf %b "\n\n$c2 config files installed! \n\n"; 
