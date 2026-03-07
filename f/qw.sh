qw() { [ -z $1 ] && (printf %b "\n\n\n\n\e[4A\n"; 
read -rep ' -- search: ' 'qe'; )||qe="$@"; 
printf %b "\n${qe[*]}"; type $qe &>/dev/null && \
(printf %b " is \e[92mINSTALLED\e[0m\n"; 
type $qe|col -xb|sed -e "s/^[\ \t]*//g") || printf %b " - not installed\n----\n"; 
$sudo apt show $qe 2>/dev/null|grep -E 'Installed|Description'|cut -f2- -d"-"; 
printf %b "\n"; whatis $qe|col -xb|sed -e "s/^[\ \t]*//g"; printf %b "\n"; }; 

####
####

qe() { [ $1 ] && qw $@ || qw $(tail -n1 $HISTFILE|col -xb|sed -e "s/^[\ \t]*//g"); }; 

####
####
