#!/bin/bash
## status
git_status() { git status --short|grep -q "" && (dott; printf %b "\e[G\e[91mzz\e[0;2m -\e[0m"; git status --short|tr -s "\n " "| "|sed -e "s/|\ /|/g" -e "s/|/\ &\ /g" -e "s/...$/\ \n/g"|bat -ppflzig DarkNeon; dott; echo; ); }; 
