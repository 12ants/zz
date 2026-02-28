#!/usr/bin/env bash
# very good bash enviorment 
shopt -s histappend; 
shopt -s histverify; 
####
export IFS=$' \n\t'; 
[ -z "$TMUX" ] && tmux || tmux source $HOME/.config/tmux/tmux.conf; 
[ $TMUX ] && . $HOME/zz/_ps1.sh || return 0;  
export HISTCONTROL="ignoreboth"; 
export PROMPT_COMMAND="history -a; history -n; "; 
export EDITOR="micro"; 
export email='leonel@ik.me'; 
export BAT_THEME="Coldark-Dark"; 
export logs="$HOME/logs"; 
export tmp="$HOME/tmp"; [ -z "$TMPDIR" ] && export TMPDIR="$HOME/tmp"; 
unset HISTTIMEFORMAT; 
hash sudo 2>/dev/null && [ "$UID" != 0 ] && export sudo="sudo"; 
####
re='\e[0m'; cyan='\e[96m'; logs="$HOME/logs"; c2="\e[96m -- \e[0m"; 
ssh=(${SSH_CONNECTION}); [ -z $ssh ] && ssh=($SSH_CLIENT); 
####
unset lessprefix; [ "$PREFIX" ] && lessprefix='--redraw-on-quit '; 
####
export LESSKEYIN=$HOME/.config/lesskey
export LESS=''${lessprefix}'-R --tilde --file-size --use-color -DP7.197$ --incsearch --mouse --prompt=%F [/]/[n]/[p]/[m] ?n?m(%T %i of %m) ..?lt %lt-%lb?L/%L. :byte %bB?s/%s.  .?e(END)  ?x-  Next\:   %x.:?pB  %pB\%..%t '; 
####
export GREP_COLORS="mt=91:ms=95:fn=32:ln=32:bn=32:se=35:sl=38;5;207:cx=38;5;121:ne"; 
####
gh auth status 2>&1|grep -e "true" -B1 --color=auto|col -xb|cut -f9 -d" "|tr -d "\n" > ~/logs/gh_log.log & disown; 
#### make som basic folders ######## 
mkdir $HOME/logs/b $HOME/tmp $HOME/gh $HOME/dl $HOME/bin $HOME/img $HOME/.config -m 775 -p 2>/dev/null; 
####
. $HOME/zz/f/dfree.sh; 
dfree > $logs/dfree.log & disown; 
####
. $HOME/zz/i/colors/coala.sh; 
####
[ $PREFIX ] && wlan="$(getprop|grep -v "gateway"|grep -E "ipv4" -m1|tr -d "[]"|cut -f2 -d" ")"; [ -z $wlan ] && wlan="$(ip -brief -4 a 2>/dev/null|grep -v "127.0.0.1"|tr -s "/\t " "\n"|grep -E "UP" -A1 -m1|tail -n1)"; [ -z $wlan ] && wlan="$($sudo ifconfig 2>/dev/null|grep -e "wlan" -A1|sed -e 1d|tr -s "a-z " "\n"|sed -e 1d -e 3,4d)"; [ "$wlan" ] && printf %b "${wlan[*]}" > $HOME/logs/wlan.log || wlan="$(cat $HOME/logs/wlan.log)"; 
####
[ -z $PREFIX ] && ii="$(ip -c -brief -4 a 2>/dev/null|grep -vE "lo |DOWN"|cut -f1 -d"/"|column --table --output-separator "$(printf %b "\e[0;2m") | ")"; [ -z "$ii" ] && ii=($(ifconfig 2>/dev/null|grep -vE "unspec|lo: |127.0.0.1" |cut -f1,10 -d" "|tr -d "\n"|bat -ppf --language Idris)); 
####
wlan="$(cat $HOME/logs/wlan.log)"; idn1="${wlan/*./}"; idn="$(($(printf %b "${idn1}"|tail -c2) + 0))"; 
. $HOME/zz/i/colors/coala.sh; unset -v idc; declare -a idc; export idc=(${co[idn]}); printf %b "${idc[*]}" > $HOME/logs/idc.log; 
####
####


if echo $HOME|grep -w "termux" -q; then unalias sudo 2>/dev/null; else sudo=sudo; fi; 
####
# [ -x $HOME/.config/fzf_completions_bash.sh ] || (fzf --bash &> $HOME/.config/fzf_completions_bash.sh; 
# chmod 775 $HOME/.config/fzf_completions_bash.sh); 
# if fzf --bash &>/dev/null; then 
# . $HOME/.config/fzf_completions_bash.sh; fi; 
####
unset tmuxprefix 2>/dev/null;  
if [ "$PREFIX" ]; then tmuxprefix=" --tmux 'center,100%,100%' "; 
else alias fzf='fzf-tmux -h 100% -w 100%'; 
fi; 
####
export FZF_DEFAULT_OPTS="${tmuxprefix} -i -m --cycle --ansi --bind 'q:abort'"; 
####
[ -x $HOME/.config/openai_api_id.conf ] && . $HOME/.config/openai_api_id.conf 2>/dev/null; 
[ -x $HOME/.config/gemini_api_id.conf ] && . $HOME/.config/gemini_api_id.conf 2>/dev/null; 
[ -x $HOME/.config/cloudflare_id.conf ] && . $HOME/.config/cloudflare_id.conf 2>/dev/null; 
####
[ -s $HOME/.config/lesskey ] || ln -s $HOME/zz/c/lesskey $HOME/.config/lesskey; 
[ -s $HOME/.config/path.sh ] && export PATH=$(cat $HOME/.config/path.sh); 
####
_model() { 
#### ____ MODEL _ GET ____ ####
[ $PREFIX ] && modo=($(getprop|grep -E 'vendor.manufacturer|product.manufacturer' -m1 -A1 --group-separator=''|cut -f2- -d' '|tr -s "\n[]" " "; )); 
####
[ -z $PREFIX ] && [ -e /sys/devices/virtual/dmi/id/product_family ] && \
modo=($(for bb in product_family board_vendor board_name bios_vendor sys_vendor; 
do cat /sys/devices/virtual/dmi/id/${bb} 2>/dev/null|grep -v "O.E.M."|tr -s "\n" " "; done)); 
####
moda="$(printf %b "${modo}"|tr -d "[]"|head -c14)"; 
model="${moda/%\ /}"; printf %b "${modo[*]}" > $HOME/logs/model.log; 
}; 
_model; 
####
kk() { 
. $HOME/zz/f/12calendar.sh; 
###################################
###################################
#### ____ OS __ GET _____ #########
[ $PREFIX ] && osx1=($(uname --operating-system; [ $PREFIX ] && getprop ro.build.version.release && getprop ro.build.version.codename)); 
####
[ "$PREFIX" ] && osx2=($((uname --kernel-name; uname --kernel-release|cut -f1 -d"-"|uniq -u; uname --machine)|tr -s "\n" " "; )); 
[ -z $PREFIX ] && osx1=($(uname --operating-system; uname --machine; uname --kernel-release|cut -f1 -d"-")); 
[ -z $PREFIX ] && osx2=($(lsb_release -sirc|tr -s "\n" " ")); 
osa1="$(printf %b "${osx1[*]}"|uniq|tr -s "\n" " "; printf %b "\b"|col -xb)"; 
osa2="$(printf %b "${osx2[*]}"|uniq|tr -s "\n" " "; printf %b "\b"|col -xb)"; 
os1="$(printf %b "${osa1}\b"|col -xb|tr -d "\n")"; os2="$(printf %b "${osa2}\b"|col -xb|tr -d "\n")";
# local IFS=$'\n\t '; 
## __ CPU __ GET _____ ##########
cpu=($(lscpu |grep -E 'Model name'|tr -s "\t" " "|cut -f3- -d" ")); 
cpus=($(lscpu|grep -e 'CPU(s):' -m1|cut -f2 -d":"|tr -d " ")); 
[ -z $PREFIX ] && videocard="$(lspci|grep -e 'VGA'|cut -f5- -d" "|sed -e "s/\ (rev.*//g")"; 
## ____ IP _ GET _____ ##########
####
####
[ -z "$ssh" ] && ssh=(${SSH_CONNECTION}); 
####
# dots() { printf %b "${re}·········${re}"; }; 
dott() { printf %b "\e[0m"; for i in $(seq ${1-50}); do printf %b "·"; done; printf %b "\e[0m"; }; 
dott; echo; 
dott; 
printf %b "\e[G$((uptime -p|tr "\n" "|"; tty)|bat -ppflgo --theme zenburn) \e[0m\n"; dott; echo; dott; 

####
printf %b "\e[G["; printf %b "${cpu[*]} x ${cpus}"|tr -s "\n" " "|bat -ppfljava --theme Dracula; printf %b "] \n"; 
####
[ "$videocard" ] && dott && printf %b "\e[G\e[2m[\e[0m" && printf %b "${videocard}"|tr -s "\n" " "|bat -ppfljava --theme DarkNeon && printf %b "\e[2m]\e[0m \n"; 
####
####
dott; echo; 
dott; printf %b "\e[G"; 
printf %b "[${os1} | ${os2}] "|tr -s "\n" " "|bat -ppfljava --theme zenburn; 
echo; dott; echo; 
########## DATE // CALENDAR ########
12calendar; 
#### IP ####
####
####
dott && printf %b "\e[G"; 
printf %b "${ii[*]} "; 
[ "$wlan" ] && printf %b "- ${wlan} "|bat -ppflsyslog --theme TwoDark; [ "$ssh" ] && printf %b "<< ${ssh}:${ssh[-1]} "|tr "\n " "\t "| bat -ppflsyslog --theme zenburn; 
echo; dott; echo; 
#### COLOR - ID #####
####
export id="$(id -un)"; 
dim='\e[2m'; bold='\e[1m'; 
re='\e[0m'; rev='\e[7m'; ver='\e[27m'; 
bg='\e[48;5;'; fg='\e[38;5;'; 
idcbg="${bg}${idc}m"; idcfg="${fg}${idc}m"; idt="\e[3${idc[2]}m"; 
####
modol() { 
moc="$(printf %b "[${modo[*]:0:7}]"|head -c44|wc -c)"; 
modol="\e[1m[$(printf %b "${modo[*]:0:7}"|head -c44|bat -ppfljava --theme gruvbox-dark)\e[1m]"; 
dott; printf %b "\e[G"; 
printf %b "\e[$((25 - moc / 2))G ${modol} \n"; 
}; 
####
modo() { gum style --border normal --align center --width 43 --bold --foreground ${idc[2]} --border-background $idc --background $idc --padding "0 1" --margin "0" "$(printf %b "${modo[*]:0:7}"|head -c41)"; };
####
memoram() { memram="$(free -h|sed -e "1s/\ \ \ \ \ /RAM: /" -e "2,3s/i/b/g" -e "s/buff\///g"|column --table --table-right 2-9 --output-separator "   " --table-hide 5,7 --table-order 1,2,3,6|sed -e "s/$/\ ·/g"|batcat -ppflc++ --theme Visual\ Studio\ Dark+)"; 
# dott() { printf %b "\e[0m"; for i in $(seq ${1-45}); do printf %b "·"; done; printf %b "\e[0m"; }; 

mw="$(printf %b "$memram\n\n"|wc -l)"; for i in $(seq $mw); do dott; printf %b "\n"; done; printf %b "\e[${mw}A\n"; printf %b "${memram}\n"; }; 
####
unicolor() { printf %b "\e[G${idcbg}${idt} ${id} $rev ${idc[3]} $ver \x23${idc[1]} $rev ${idc[0]} \e[0m \n"; }; 
####
#### COLOR 
#### MODEL

dott; 
unicolor; 
dott; echo; 
modol; 
memoram; 
dott; echo; 
####
####
[ "$(cat ${logs}/dfree.log|wc -c)" -gt 4 ] && cat "${logs}/dfree.log" || dfree; dott; echo; 
#### RAM
#### DISK
####
printf %b "\x1b[1 q"; ########### cursor = block
printf %b "\x1b]12;#ff44bb"; #### cursor = pink
####
[ $PREFIX ] && sshd & disown 2>/dev/null; 
[ $PREFIX ] && crond & disown 2>/dev/null; 
[ $PREFIX ] && (sleep 2; termux-api-start &>/dev/null) & disown; 
[ $PREFIX ] && (sleep 4; termux-wake-lock &>/dev/null) & disown; 
####
}; 
####
for i in $HOME/zz/f/*.sh; do . $i; done; 
####
. $HOME/zz/alias.sh; 
. $HOME/.config/tmux/tmuxcompletions.sh; 
