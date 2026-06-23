#!/usr/bin/env bash
fl="${HOME}/logs/ai"; mkdir -p "$fl" 2>/dev/null; fl="$fl"/kilog.md; 
####
cd $1; pwd >> $HOME/ll.log; 
printf %b "[$(date)] \nPWD-$PDW_fl-$fl_LOGNAME-$LOGNAME_UID-$UID_SHELL-$SHELL_EPOC-$EPOCHSECONDS_SECONDS-$SECONDS_HOSTNAME-$HOSTNAME_0-$0_--$-_#-$# \n" >> $fl; printf %b "[$(date)] $PDW - start\n" >> $fl; 
####
test1="run tests and fix any failures. add short log to a logfile in the root folder"; 
test2="analyze this project and come up with suggestions on how to fix, improve, enhance and optimize this project and write them in to a well structured list and save as a md file with descriptive title";  
####
timeout 8000 "kilo run --auto ${test1}"; printf %b "[$(date)] $PDW - test1 end\n" >> $fl; sleep 22; 
timeout 8000 "kilo run --auto ${test2}"; printf %b "[$(date)] $PDW - alles end\n" >> $fl; 
####
cd $1; pwd >> $HOME/ll.log; 
printf %b "[$(date)] \nPWD-$PDW_fl-$fl_LOGNAME-$LOGNAME_UID-$UID_SHELL-$SHELL_EPOC-$EPOCHSECONDS_SECONDS-$SECONDS_HOSTNAME-$HOSTNAME_0-$0_--$-_#-$# \n" >> $fl; printf %b "[$(date)] $PDW - start\n" >> $fl; 
kilo run --auto "execute tasks as described from ${HOME}/zz/crons/impro.md in the project folder $*"; 
####
####
