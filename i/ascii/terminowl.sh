#!/bin/bash
IFS=$' \n\t'; 
delete_line() { printf %b "\x1b[K"; }; 
#### count lines of anim
declare -i wl=$(printf %b '  /\_/\ \n (0 _ 0)\n   · ·\n\n'|wc -l);
#for i in {1..9}; do 
#printf %b "\x1b[u"; 
printf %b "\x1b[?25l\n"
for i in "$(seq $wl)"; do printf %b "\x1b[1K\n"; done; 
printf %b "\r\n"; 
sleep .2; printf %b "\x1b[${wl}A\x1b[K"; 
printf %b "\x1b[K
\x1b[K  /\_/\  
\x1b[K (0 _ 0) 
\x1b[K   · ·   
\x1b[K          ";
sleep .2; printf %b "\x1b[${wl}A\x1b[K"; 
printf %b "\x1b[K\x1b[?25l
\x1b[K  /\_/\ 
\x1b[K (- _ -)
\x1b[K   · ·    
\x1b[K";
sleep .2; printf %b "\x1b[${wl}A\x1b[K"; 
printf %b "\x1b[K\x1b[?25l
\x1b[K  /\_/\ 
\x1b[K (0 _ 0)
\x1b[K   · ·    
\x1b[K";
sleep .2; printf %b "\x1b[${wl}A\x1b[K"; 
printf %b "\x1b[K\x1b[?25l
\x1b[K  /\_/\ 
\x1b[K (0 _ 0)
\x1b[K   · ·   
\x1b[K";
sleep .2; printf %b "\x1b[${wl}A\x1b[K"; 
printf %b "\x1b[K\x1b[?25l
\x1b[K  /\_/\ 
\x1b[K (0 ..0)
\x1b[K   · ·    
\x1b[K";
sleep .2; printf %b "\x1b[${wl}A\x1b[K"; 
printf %b "\x1b[K\x1b[?25l
\x1b[K  /\_/\ 
\x1b[K (0.. 0)
\x1b[K   · ·    
\x1b[K";
sleep .2; 
echo -e "\e[${wl}A
\e[K
\e[K  /\_/\ 
\e[K (0 . 0)
\e[K   · ·
\e[K  
";



printf %b "\x1b[?25h\n\n"
#done; 
#printf %b "\x1b[s"; 
