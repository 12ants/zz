#!/usr/bin/env bash
# very good bash enviorment 
# date +%H:%M:%S.%N; 
###################
case $- in *i*) ;; *) return;; esac; 
###################
pgrep -o "tmux" &>/dev/null || exec tmux; [ -z "${TMUX}" ] && tmux attach; 
###################
shopt -s histappend; shopt -s histverify; 
###################
export IFS=$' \n\t' PROMPT_COMMAND="history -a; history -n; " HISTCONTROL="ignoreboth" EDITOR="micro" BAT_THEME="Coldark-Dark" VERSION_CONTROL="numbered" HISTSIZE="12222" email='leonel@ik.me' logs="$HOME/logs" zz="$HOME/zz" start="$HOME/zz" HISTTIMEFORMAT=; 
###################
[ -e "$HOME/gh/appi/appi.sh" ] && . "$HOME/gh/appi/appi.sh"; 
###################
for i in ${zz:-${HOME}/zz}/f/*.sh; do . $i; done; 
###################
. ~/zz/alias.sh; 
. ~/zz/_ps1.sh; 
###################
hash sudo 2>/dev/null && [ "$UID" != 0 ] && export sudo="sudo"; 
###################
ssh=(${SSH_CONNECTION}); 
[ -z $ssh ] && ssh=($SSH_CLIENT); 
###################
unset lessprefix; [ "$PREFIX" ] && lessprefix='--redraw-on-quit '; 
export LESSKEYIN="$HOME/.config/lesskey" LESS=''${lessprefix}'-R --tilde --file-size --use-color -DP7.197$ --incsearch --mouse --prompt=%F [/]/[n]/[p]/[m] ?n?m(%T %i of %m) ..?lt %lt-%lb?L/%L. :byte %bB?s/%s.  .?e(END)  ?x-  Next\:   %x.:?pB  %pB\%..%t ' GREP_COLORS="mt=91:ms=95:fn=32:ln=32:bn=32:se=35:sl=38;5;207:cx=38;5;121:ne" FZF_DEFAULT_OPTS='-m -i --cycle --ansi --unicode --bind "q:abort"'; 
###################
if echo $HOME|grep -w "termux" -q; then unalias sudo 2>/dev/null; else sudo=sudo; fi; 
[ $PREFIX ] && wlan="$(getprop|grep -v "gateway"|grep -E "ipv4" -m1|tr -d "[]"|cut -f2 -d" ")"; 
[ -z $wlan ] && wlan="$(ip -brief -4 a 2>/dev/null|grep -v "127.0.0.1"|tr -s "/\t " "\n"|grep -E "UP" -A1 -m1|tail -n1)"; 
[ -z $wlan ] && wlan="$(ifconfig 2>/dev/null|grep -e "wlan" -A1|sed -e "1d" -e "s/netmask.*//"|tr -d " a-z")"; 
[ "$wlan" ] && printf %b "${wlan[*]}" > $HOME/logs/zz/wlan.log || wlan="$(cat $HOME/logs/zz/wlan.log)"; ####
[ -z $PREFIX ] && ii="$(ip -c -brief -4 a 2>/dev/null|grep -vE "lo |DOWN"|cut -f1 -d"/"|column --table --output-separator "$(printf %b "\e[0;2m") | ")"; 
[ -z $PREFIX ] && [ -z "$ii" ] && ii=($(ifconfig 2>/dev/null|grep -vE "unspec|lo: |127.0.0.1" |cut -f1,10 -d" "|tr -d "\n"|bat -ppf --language Idris)); 
####
wlan="$(cat $HOME/logs/zz/wlan.log)"; idn1="${wlan/*./}"; idn="$(($(printf %b "${idn1}"|tail -c2) + 0))"; 
####
. $HOME/zz/i/colors/coala.sh; unset -v idc; declare -a idc; export idc=(${co[idn]}); printf %b "${idc[*]}" > $HOME/logs/zz/idc.log; 
####
_model() { [ $PREFIX ] && modo=($(getprop|grep -E 'vendor.manufacturer|product.manufacturer' -m1 -A1 --group-separator=''|cut -f2- -d' '|tr -s "\n[]" " "; )); [ -z $PREFIX ] && [ -e /sys/devices/virtual/dmi/id/product_family ] && modo=($(for bb in product_family board_vendor board_name bios_vendor sys_vendor; do cat /sys/devices/virtual/dmi/id/${bb} 2>/dev/null|grep -v "O.E.M."|tr -s "\n" " "; done)); moda="$(printf %b "${modo}"|tr -d "[]"|head -c14)"; model="${moda/%\ /}"; printf %b "${modo[*]}" > $HOME/logs/zz/model.log; }; 
####
_model; 
####
# date +%H:%M:%S.%N; 
####
