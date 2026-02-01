hhup() { mt=$(mktemp); tail -n 288 $HISTFILE|bat -ppfljava|command fzf --ansi --tac --height "~5%" --border none --info inline-right --preview-window "hidden" --no-separator --no-scrollbar --color "bg:234,bg+:29" --no-unicode --pointer "#" --ellipsis "" > $mt; chmod +x $mt; 
history -s "$(cat $mt)"; 
history -w; 

# IFS=$'\n\t '; 
read -rei "$(tail -n1 $HISTFILE)" ssss; 
eval "$ssss"; 
# history -w; 
# read -ei "$BASH_COMMAND" ssss; 
# history -s "$(tail -n1 "$HISTFILE")"; 
# read -ei "$(tail -n1 "$HISTFILE")" "ssss" && ${ssss} || echo ok; 
}; 
