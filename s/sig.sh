#!/bin/bash
## trap errors
####
unset -v s; 
####
s[1]="SIGHUP"; s[2]="SIGINT"; s[3]="SIGQUIT"; s[4]="SIGILL"; s[5]="SIGTRAP"; s[6]="SIGABRT"; s[7]="SIGBUS"; s[8]="SIGFPE"; s[9]="SIGKILL"; s[10]="SIGUSR1"; s[11]="SIGSEGV"; s[12]="SIGUSR2"; s[13]="SIGPIPE"; s[14]="SIGALRM"; s[15]="SIGTERM"; s[16]="SIGSTKFLT"; s[18]="SIGCONT"; s[19]="SIGSTOP"; s[20]="SIGTSTP"; s[21]="SIGTTIN"; s[22]="SIGTTOU"; s[23]="SIGURG"; s[24]="SIGXCPU"; s[25]="SIGXFSZ"; s[26]="SIGVTALRM"; s[27]="SIGPROF"; s[28]="SIGWINCH"; s[29]="SIGIO"; s[30]="SIGPWR"; s[31]="SIGSYS"; s[41]="SIGRTMIN"; s[42]="SIGRTMIN_1"; s[43]="SIGRTMIN_2"; s[44]="SIGRTMIN_3"; s[45]="SIGRTMIN_4"; s[46]="SIGRTMIN_5"; s[47]="SIGRTMIN_6"; s[48]="SIGRTMIN_7"; s[49]="SIGRTMIN_8"; s[50]="SIGRTMIN_9"; s[51]="SIGRTMIN_10"; s[52]="SIGRTMIN_11"; s[53]="SIGRTMAX_11"; s[54]="SIGRTMAX_10"; s[55]="SIGRTMAX_9"; s[56]="SIGRTMAX_8"; s[57]="SIGRTMAX_7"; s[58]="SIGRTMAX_6"; s[59]="SIGRTMAX_5"; s[60]="SIGRTMAX_4"; s[61]="SIGRTMAX_3"; s[62]="SIGRTMAX_2"; s[63]="SIGRTMAX_1"; s[64]="SIGRTMAX"; 
####
for i in ${!s[*]}; do 
trap "echo -ne '\n\e[0;2m[\e[0;1;38;5;1${i}m$i\e[0;2m]\e[0;1m${s[i]}\e[0;2m\n[\e[0;1;38;5;'"'$(($? + 42))m$?'"'\e[0;2m][\e[0;1m'"'${BASH_COMMAND[*]}'"'\e[0;2m]\e[0m \n' " $i; 
done; 

####
####
printf %b "s[$(trap -l|tr -d " "|tr -s ")\t\n" "];"|sed -e "s/\;/\;\ns[/g")" |sed -e s/\]/\]\=\"/g -e s/\;/\"\;/g|head -n-1|tr "\n+\-" " _" > $TMPDIR/kk.sh; chmod 775 $TMPDIR/kk.sh; . $TMPDIR/kk.sh; 
