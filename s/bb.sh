#!/bin/bash
bp="$(cat ~/logs/b/bp.log)"; 
case $((bp / 10)) in 0) bc=28;; 1) bc=9;; 2) bc=200;; 3) bc=166;; 4) bc=130;; 5) bc=130;; 6) bc=94;; 7) bc=100;; 8) bc=64;; 9) bc=64;; esac; 
printf %b "\e[0m\e[38;5;240m\e[2m"; 
for i in {1..50}; do printf %b "#"; done; 
printf %b "\e[G\e[0m\e[38;5;${bc}m"; 
for i in $(seq $((bp / 2))); do printf %b "#"; done; 
printf %b "\e[0m\e[2m"; 
printf %b "[\e[0m\e[38;5;${bc}m\e[0m$(cat ~/logs/b/bp.log)\e[2m%\e[0m\e[2m]\e[0m\n"; 
