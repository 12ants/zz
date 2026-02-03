ok() { 
####
wd="$((COLUMNS - 1))" 
wc="$(figlet -w${wd} -cf rebel "${*-ok} "|wc -l)"; 
####
fifi() { 
rr1=$((RANDOM%222)); 
rr2=$((RANDOM%222)); 
rr4=$((RANDOM%12)); 
figlet -w${wd} -cf rebel "${*}"|sed -e \
"s/█/\x1b[38;5;${rr1}m█\x1b[0m/g" -e \
"s/▒/\x1b[38;5;${rr2}m▒\x1b[0m/g"; 
}; 
####
for i in $(seq $wc); do echo; done; 
printf %b "\n\n\e[?25l"; 
for i in {1..22}; do 
printf %b "\e[${wc}A"; 
fifi "${*-ok}"; read -sn1 -t .1; 
[ $? != 142 ] && break; 
done; printf %b "\e[?25h"; 
####
}; 
