#!/bin/bash
## test connection
unalias speed 2>/dev/null; unset speed 2>/dev/null; 
####
speed() { 
printf %b "\n\n\n\n\e[4A\n\e[$((COLUMNS/2-12))G $c2 SPEED TEST $c2\n\n"; 
####
hash wget 2>/dev/null || $sudo apt get wget -y &>/dev/null; 
####
trap echo 2; 
wget --no-verbose --show-progress --progress=bar --unlink \
"https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/debian-13.4.0-amd64-DVD-1.iso" -LO "speed"; 
trap 2; 
####
echo aa; 
rm "speed"; 
echo bb; 
}; 
