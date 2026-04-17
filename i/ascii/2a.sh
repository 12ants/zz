#!/bin/bash
terminowl() { 
printf %b '\e[?25l'; 
for i in {1}; do 
printf %b '
\e[2K  /\_/\
\e[2K (0 . 0)
\e[2K   · ·
'; 
read -sn1 -t.2 && return;  
printf %b ' \e[4A 
\e[K  /\_/\
\e[K (0 . 0)
\e[K   ^ ·
'; 
read -sn1 -t.2 && return;  
printf %b '\e[4A 
\e[2K  /\_/\
\e[2K (0 . 0)
\e[2K   · \x27
'; 
read -sn1 -t.2 && return;  
printf %b '\e[4A 
\e[2K  /\_/\
\e[2K (0 . 0)
\e[2K   \x27 .
'; 
read -sn1 -t.2 && return;  
printf %b '\e[4A  
\e[2K  /\_/\
\e[2K (0 . -)
\e[2K   . \x27
'; 
read -sn1 -t.2 && return;  
printf %b '\e[4A 
\e[2K  /\_/\
\e[2K (- . -)
\e[2K   · ·
'; 
read -sn1 -t.2 && return;  
printf %b '\e[4A 
\e[2K  /\_/\
\e[2K (0 = 0)
\e[2K   · ·
'; 
read -sn1 -t.2 && return;  
printf %b '\e[4A 
\e[2K  /\_/\
\e[2K (0 . 0)
\e[2K   · ·
'; 
read -sn1 -t.2 && return;  
printf %b '\e[4A 
\e[2K  /\_/\
\e[2K (0 O 0)
\e[2K   . .
'; 
read -sn1 -t.2 && return;  
printf %b '\e[4A 
\e[2K  _^ ^_
\e[2K (0() 0)
\e[2K   . .
'; 
read -sn1 -t.2 && return;  
printf %b '\e[4A 
\e[2K  /\_/\
\e[2K (0 . 0)
\e[2K   · ·
'; 
read -sn1 -t.2 && return;  
printf %b '\e[4A
\e[2K  /\_/\
\e[2K (° ~ °)
\e[2K   - -
'; 
read -sn1 -t.2 && return; 
printf %b '\e[4A
\e[2K  /\_/\
\e[2K (0 O 0)
\e[2K   ^ ^
'; 
read -sn1 -t.2 && return; 
printf %b '\e[4A'; done; 
printf %b '\n\e[?25h\n'; }; 
##
terminowl; 
echo; echo; 


