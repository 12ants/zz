hihi() { 
IFS=$' \n\t'; 
tmp=$HOME/tmp; mkdir $tmp 2>/dev/null; 
h1="$tmp/$(id -nu|tr -d "\n"; date +%y%m%d%H%M%S).sh"; touch $h1;
####
# if [ $PREFIX ]; 
####
#history -s "$(FZF_DEFAULT_OPTS= bat -ppfljava $HISTFILE | tr -s "\n" "\n" | uniq -u | fzf --tac -i -m --cycle --bind "q:abort" --style="minimal" --info inline --preview-window "hidden"; if [ $? != 0 ]; then $(return 1); echo; else history -a; history -n; fi; )"||return 1 | tee -a $HISTFILE; if [ $? != 0 ]; then echo okok; return 1; else history -a; history -n; fi;
####
hists="$(unset FZF_DEFAULT_OPTS; tail -n2888 $HISTFILE|tr -s "\n\t" "\n "|tac|bat -ppflc++ --theme Dracula|command \
fzf -i -m \
--cycle \
--ansi \
--bind "q:abort,backward-eof:abort,0:toggle-preview,change:first,focus:transform-prompt:printf %b '{n} > '" \
--preview 'bat -ppfljava {}' \
--preview-window 'top,5,wrap,hidden,border-bottom' \
--wrap \
--info inline \
--no-border \
--height "85%" \
--border none \
--no-scrollbar \
--color "bg:234,bg+:125" \
--pointer "0" \
--ellipsis "" \
--scroll-off "50" \
--unicode \
--wrap-sign "" \
--prompt '0 > ')";

# hists="$(unset FZF_DEFAULT_OPTS; tail -n2888 $HISTFILE|tac|bat -ppflc++ --theme Dracula|command fzf -i -m --cycle --ansi --bind "q:abort,backward-eof:abort,change:toggle-wrap" --info inline --no-border --height "~55%" --border none --preview-window hidden --no-scrollbar --color "bg:234,bg+:125" --pointer "0" --ellipsis "" --scroll-off "50" --unicode)"; 
####
if [ "${hists}" ]; then history -s "$(printf %b "${hists}")"; history -a; history -n;
linedash() { printf %b "\e[96m-\e[222b\e[0m\n"; }; 
####
linedash; 
printf %b "saved to: \n$dim$h1$re\n"; 
linedash; 
tail -n1 $HISTFILE | tee $h1; 
linedash; 
#printf %b "\
#1) micro : \n\
#2) cp to : \n\
#4) gist : \n\
#5) cmd : \n\
#*) ok : " \
#|bat -ppfljava; 
####
#read -rsn1 "ny"; 
####
#case $ny in
#1) micro $h1;; 
#2) read -ep "cp to: " -i "$HOME/" "hhto"; cp -b $h1 $hhto;;
#4) read -ep "name: " -i "$h1" h2; mv $h1 $h2; gh gist create $h2;;
#5) read -ep "cmd: " -i "$PREFIX/bin/" "h2"; $h2 $h1;;
#*) printf %b "ok \n"; read -rei "$hists" kk; eval "$kk"; return;; esac; 
####
else printf %b "ok \n"; fi; 
####
};

