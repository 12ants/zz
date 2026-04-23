#!/bin/bash
## call out time
notvolume="$(termux-volume|grep -e "system" -A1|grep -e "[[:digit:]]" --only-matching;)"; 
termux-volume system 4; 
termux-tts-speak -s SYSTEM "the time is $(date +%H-%M). battery is at $(bash $HOME/zz/crons/bat.sh)%."; 
termux-volume system $notvolume; 
