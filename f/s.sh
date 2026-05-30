s() { 
local IFS=$'\n\t '; u="aa"; s=($u@192.168.0.14 $u@ants.ftp.sh $u@192.168.0.34 $u@192.168.0.19 $u@192.168.0.20); 
p=(22 8022); 

sl="$(printf %b "${s[*]}" | wc -l)"; sh="$(printf %b "${s[*]}" | wc --max-line-length)";
sc=($(printf %b "${s[*]}" | fzf --color 'bg:6' --tmux "center,$((sh + 6)),$((sl + 4))" --bind 'enter:print-query' --disabled --info inline  --bind 'focus:replace-query')) || return 2; 
[ -z "${sc}" ] && return 1
####
pl="$(printf %b "${p[*]}" | wc -l)"; ph="$(printf %b "${p[*]}" | wc --max-line-length)";
pc=($(printf %b "${p[*]}" | fzf --color 'bg:5' --tmux "center,$((ph + 6)),$((pl + 4))" --bind 'enter:print-query' --disabled --info inline  --bind 'focus:replace-query')) || return 2; 
####
[ -z "${pc}" ] && return 4; 
####
printf %b "-\e[${COLUMNS}b\n"; 
ssh -p $pc $sc; 
printf %b "-\e[${COLUMNS}b\n"; 

};
