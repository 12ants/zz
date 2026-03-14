#!/bin/bash
## install cloudpanel.io 
####
####
IFS=$' \n\t'; [ -z "$c2" ] && c2="\x1b[0m\x1b[96m--\x1b[0m"; 
####
unset -f qmenu; qmenu() { local IFS=$' \n\t'; unset mark; local ops=($2); [ -z "$2" ] && local ops=(*); local prompt="$1" index="0" cur="0" count="${#ops[@]}"; printf "\n\e[?25l -- $prompt --\n\n"; while true; do local index="0"; for o in "${ops[@]}"; do if [ "$index" == "$cur" ]; then printf %b "\e[0m > \e[7m $o \e[0m\e[K\n"; else printf %b "\e[0m $o \e[K\n"; fi; (( index++ )); done; read -srn1 key; if [[ "$key" == A ]]; then (( cur-- )); (( cur < 0 )) && (( cur = 0 )); else if [ "$key" == B ]; then (( cur++ )); (( cur >= count )) && (( cur = count - 1 )); else if [[ "$key" == C ]]; then [ ${mark[$cur]} = 0 ] && mark[$cur]=1 || mark[$cur]=0; printf %b "\e[K ${mark[@]} ${ops[$mark]} \e[K"; else if [[ $key == "" ]]; then break; else if [[ $key == "q" ]]; then break; fi; fi; fi; fi; fi; for i in ${!mark[*]}; do [ "${mark[$i]}" = 1 ] && printf %b "${ops[$i]} ok\n"; done; printf %b "\e[${count}A"; done; printf -v "db" "${ops[$cur]}"; printf "\e[?25h\n \e[7m $sel \e[0m\n\n"; }; 
####
unset -v d r; d='\x1b[2m' r='\x1b[0m'
unset -v db; db="MYSQL_8.4"; 
printf %b "\n\n\n\n\n\x1b[4A $c2 choose cloudpanel database? ${d}[${r}Y${d}/${r}n${d}]${r} "; 
printf %b "\x1b[s"; 
for i in {1..12}; do 
printf %b "\x1b[u"; 
printf %b "$((12 - i)) "; 
read -st 1 -n1 "ddbb" && echo "$ddbb"|grep -qE '(y||Y)' && \
qmenu "db" "MYSQL_8.4 MYSQL_8.0 MARIADB_11.4 MARIADB_10.11"; 
done; 
####
curl -sS https://installer.cloudpanel.io/ce/v2/install.sh -o install_cloudpanel.sh; 
echo "19cfa702e7936a79e47812ff57d9859175ea902c62a68b2c15ccd1ebaf36caeb install_cloudpanel.sh" | sha256sum -c && sudo DB_ENGINE=${db} bash install_cloudpanel.sh; 
####
