hhup() { 

eval $(mt=$(mktemp); tail -n 999 $HISTFILE|bat -ppfljava|command fzf --ansi --tac --height "~5%" --border none --info inline --preview-window "hidden" --no-separator --no-scrollbar --color "bg:234,bg+:29" --no-unicode --pointer "#" --ellipsis "" |tee $mt; chmod +x $mt; ); 
history -s "$(cat $mt)"; 
history -w; 
read -rei "$(tail -n1 $HISTFILE)" ssss; 
eval "$ssss"; 
}; 
