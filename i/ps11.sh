PS1="\e[0;2m\A\e[0m"'$(printf %b "\e[38;5;$((255 - $?))m$(($?))\e[37;2m"; stty size|sed "s/\ /\x1b[0;34m/g")'"\e[0m:\e[0;36m\u\e[37m@\e[95m\H\e[0;2m:\e[0;93m\w\e[2m/\e[0m\n"; 
