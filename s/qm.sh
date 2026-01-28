# qqmenu() { local 
IFS=$'\n\t' ops=($*);[ "$2" ]||IFS=$'\n\t' ops=(*); 
unset mark sela; 
#
qtoggle() { if echo ${mark[@]}|grep -qo $cur; then mark=(${mark[@]/$cur/}); else mark+=($cur); fi; }; 
# qm() { if echo ${mark[@]}|grep -qo $cur; then qm='\e[92m'; printf i; unset qm; else qm='\e[96m'; printf o; fi; }; 
# local 
prompt="$1" index="0" cur="0" count="${#ops[@]}" esc=$(echo -ne "\e");
printf "\e[?25l    ----- [C]onfirm -- [Q]uit ----\n"; ## print prompt
while true; do index="0"; for o in "${ops[@]}"; ## print options
do if [ "$index" == "$cur" ];
then printf %b " [\e[0m>] \e[7m $o \e[0m\e[K\n"; ## mark & highlight the current option
else printf %b " [\e[0m ]  $o  \e[K\n";
fi; (( index++ ));
done; ## list all options (option list is zero-based)
printf "\e[?25l    ----- [C]onfirm -- [Q]uit ----\n"; ## print prompt
read -srn1 key; ## wait for user to key in arrows or ENTER
case $key in 
A) (( cur-- )); (( cur < 0 ))&& (( cur = 0 ));;
B) (( cur++ )); (( cur >= count )) && (( cur = count - 1 ));;
""|" ") qtoggle;;
"c") break;; 
"q") echo; return 8;; 
esac; 
# [ ${mark[-1]} = confirm ] && return 6; 
# if [[ "$key" == A ]]; then elif [ "$key" == B ]; then elif [[ $key == C ]]; then qtoggle; elif [[ $key == "" ]]; then break;elif [[ $key == "q" ]]; then break; fi; # enter
##
sela="$(for i in ${mark[*]}; do printf %b "${ops[i]} "; done)"; 
printf %b "\e[s\e[$((LINES - 1));44\e[K${sela[@]}\e[K\e[u";

printf %b "\e[$((count + 1))A"; done; # go up to the beginning to re-render
##
# elif [[ $key == D ]]; then mark=(${mark[@]/$cur/}); 
printf %b "\n\n\e[?25h\e[7m$(for i in ${mark[*]}; do printf %b " ${ops[i]} \n"; done)\e[0m\n\n"; 
##
# ${sela[*]}

# printf -v sel "${ops[$cur]}"; printf  "\e[?25h\n \e[7m $sel \e[0m\n\n"; 

# mark=("${mark[@]/${ops[cur]}/}")
