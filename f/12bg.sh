12bg() { [ $1 ] && bg="$1" || bg='041820'; bgreset() { printf %b "\x1b]11;#${bg}\e\\"; }; bgreset; [ -z $1 ] && printf %b "\n\n\e[A" && read -rp ' #' "bg" && bgreset; }; 
