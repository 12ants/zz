topo() { top -Em -bn1 -o RES -cem -w|head -n12|bat -ppflc#|sed -e "7,\$a\\\x1b[2m\n-\x1b[444b\n"; }; 
