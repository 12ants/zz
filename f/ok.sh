ok() { printf %b "\e[?25l\n\n\n\n\n\n\n\n\e[5A"; for i in {1..22}; do fifi "${*-ok}"; read -sn1 -t .1; [ $? = 142 ] && printf %b "\e[11A" || break; done; printf %b "\e[?25h"; fifi() { rr1=$((RANDOM%222)); rr2=$((RANDOM%222)); figlet -tcf rebel ${1-$(date)}|sed -e "s/█/\x1b[38;5;${rr1}m█\x1b[0m/g" -e "s/▒/\x1b[38;5;${rr2}m▒\x1b[0m/g"; }; }; 

