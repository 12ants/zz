#!/usr/bin/env bash
# very good bash enviorment 
###################
pgrep -o "tmux" &>/dev/null || exec tmux; 
###################
shopt -s histappend; 
shopt -s histverify; 
###################
export IFS=$' \n\t'; 
[ -z "$TMUX" ] && command -v tmux >/dev/null 2>&1 && tmux 2>/dev/null; 
[ "$TMUX" ] && tmux source $HOME/.config/tmux/tmux.conf 2>/dev/null; 
[ "$TMUX" ] && . $HOME/zz/_ps1.sh; 
export PROMPT_COMMAND="history -a; history -n; ";
export HISTCONTROL="ignoreboth"; 
export EDITOR="micro"; 
export BAT_THEME="Coldark-Dark"; 
export VERSION_CONTROL="numbered"; 
export HISTSIZE="12222"; 
export email='leonel@ik.me'; 
export logs="$HOME/logs"; 
export zz="$HOME/zz"; export start="$HOME/zz"; 
unset HISTTIMEFORMAT; 
## export HISTFILESIZE="12222"
###################
###################
###################
###################
if [ -d "$HOME"/gh/appi ]; then for i in "$HOME"/gh/appi/api_*.sh; do . $i; done; fi; 
###################
for i in ${zz:-${HOME}/zz}/f/*.sh; do . $i; done; 
###################
. ~/zz/alias.sh; 
. ~/zz/_ps1.sh; 
###################
###################
hash sudo 2>/dev/null && [ "$UID" != 0 ] && export sudo="sudo"; 
###################
ssh=(${SSH_CONNECTION}); 
[ -z $ssh ] && ssh=($SSH_CLIENT); 
###################
unset lessprefix; [ "$PREFIX" ] && lessprefix='--redraw-on-quit '; 
export LESSKEYIN=$HOME/.config/lesskey
export LESS=''${lessprefix}'-R --tilde --file-size --use-color -DP7.197$ --incsearch --mouse --prompt=%F [/]/[n]/[p]/[m] ?n?m(%T %i of %m) ..?lt %lt-%lb?L/%L. :byte %bB?s/%s.  .?e(END)  ?x-  Next\:   %x.:?pB  %pB\%..%t '; 
###################
export GREP_COLORS="mt=91:ms=95:fn=32:ln=32:bn=32:se=35:sl=38;5;207:cx=38;5;121:ne"; 
export FZF_DEFAULT_OPTS='-m -i --cycle --ansi --unicode --bind "q:abort"'; 
###################
####################
