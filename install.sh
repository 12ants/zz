#!/bin/bash
## 12ants/zz -- installer
seq $LINES; 
o='\e[96;1m --\e[0m'; 
printf %b "\e[?25l"; 
for i in {1..6}; do 
hello="\e[95;1mhello\e[0m\e[9${i}m"; 
printf %b "\e[1J\e[H\e[9${i}m

               ▒▓█▓▓▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░                   
          ░▒▓▓▓▓▓▓▓▒▒▓▓▓▓▓▓▒▒░░ ░  ░░ ░   ░░░░░░▒▒▒▒▒▒▒▒░             
       ▒▓▓▓▓▓▓▓▒▒▒░░░░░░░░▒▒░░▒▒▒░ ░░ ░░     ░░░░░░░░░ ░░░░░▒▒▓▒░         
   ░▒▓█▓▓▓▓▒▒░░░▒░▒▒▒▒▒▒▒▒  ░▒▒▒░░ ░       ░░░░    ░░░░░░░░░ ░░▒▒▒▒░      
  ▒██▓░  ░░░░▒▒▒░ ░░░░  ░▒ ░▒░░░ ▒ ░░░  ░░░░░    ░     ░   ░░▒░░ ░░▒▒▒░   
  ██░▒▒▒░░  ░░▒▒░ ▒     ▒▒░▒░    ▒ ░               ░          ░░░░░ ░▒▓░  
 ░█▓▒▓░ ░ ░░▒   ▒░▒     ▒░▒░░    ░ ░                            ░░░░░ ▒▓░ 
 ▒░░ ▒░░░▒░░▒░░▒▓▒▓░    ▒░░ ░▒▒▒░░ ░                       ░░      ░░░░░▒░
 ▒▒▒▒▒▓▓▓▓░▒░ ░▓█▓██▓░  ░░░▒▒▓▓█▓▒░▒▒░ ░ ░            ░    ░     ░    ░ ▒▒
  ░▓█▓▒░ ▒░▒▒▒▒▒░ ▒██▒░░░░░ ░▒▒▒▒░    ░░░▒▒░░░░░░    ░░░░ ░ ░░        ░░▒▓
    ▒█████░░▓▓▒░ ░ ▒▒░░▒▒▒░ ░▒░░▒▓▒▒░ ▒░▒▓█▓▒░  ░▒▓▒░▒░░▒▒▒░▒▒▓▒░     ░░▒▒
       ░▓███████▒░ ▒▒░ ▒▒▒▒▒░▒  ▒▓▒▒▓█▓░░ ▒▓▓▒░░ ▒░▒▓▒▒░▒▒▒▒▓▓▓▓▒    ░░░▒░
         ░█████████▒░░ ▒▓▓▓▓▓██▓▒▒░ ░░▒▒▓█▓ ▒▒░▒▒░░ ░▒▒▒▒▒▒    ▒▒   ░ ░▒░ 
                ▒░░▒▒▒▒▒▓██████▒░░░▒▓███▓▓█▒▒░    ░▓█▓▓▓▓████▓▒ ▒▒▒  ░░   
  $hello        ░░ ░▒▒▒░      ▒▒▓▓▒░      █░▒░░▒▓█▓▓░     ░▒▒▓▓▒▒ ▒▒░░    
                ░▒▒▒░         ░▒▒░        ▓▒▒▒▒▒░             ░▒▒▒▒▒▓     
                                          ░▒░░░                  ▒▓▓▓     
                                                                 ░▒▒░  "; 
sleep .2; done; printf %b "\e[?25l"; 
printf %b "\n\e[A\e[0m $o dl 12ants/zz git? [\e[2mY\e[0m/\e[2mn\e[0m] "; 
read -n1 -sr "ny"; 
if [ -z "$ny" ]; then 
printf %b " $o ok\n $o whereto? "; 
read -rei "$PWD" "aa"; zz="$aa/zz"; 
cd $aa; rm zz 2>/dev/null; 
hash sudo 2>/dev/null && sudo="sudo"; 
hash git || $sudo apt install -y git &>/dev/null; 
printf %b "\n $o downloading ... \n"; 
git clone https://github.com/12ants/zz 2>/dev/null; 
# cd zz; . menu.sh; menu "./install"; 
################
else echo;echo; fi; echo -e "\n\e[1;5m\t>_<\n\n\e[0m"; 
####
####
seq $LINES; 
o='\e[96;1m --\e[0m'; 
printf %b "\e[?25l"; 
for i in {1..6}; do 
hello="\e[95;1mh€llø\e[0m\e[9${i}m"; 
printf %b "\e[1J\e[H\e[9${i}m
                          .
                                ...             ...
                            .',,;;;;,,,'''.       ......
                      .,;;;;:::ccc:;;;;;,''        .'''''..
                    .;;;:ccccccccc:;;;;;;,'.         .'''''''.
                   ';;;:cccccccccc;;:;;;;;''.        .''''''''..
                  .;;;:cccccccccccc::;;;;;;''.      .''''''''''''
                  .;;::cccccccccccccc:;;;;;'.        ''''''''''''.
                   ;;;;:ccccccccccccccc:,,,.        .''''''''''''''.
                   ,,,,,,;;;:;::cc::.               .''''''''''''''.
                   ,..'.......':cc;                  .'''''''''''''.
                   ,'........',:cc;   .               ''''''''''''''
                   ;;;',,.';;;;:cc;   ',..           .''''''''''''''
                   ':c:;::::::;:c:,   .'''. ...      '''''''''''''''
                    ;cccccccc:;cc:;.  ''''''''         '''''''''''''
                    ,;ccccccc;:cc:;'   '''''.           ''''''''''''
                     ;;:ccccc;.;:,     .''''             .       ..
                      ';ccc;            '''.
  $hello               ;:
                        .
                             .....



                                   .
"; 
sleep .2; done; printf %b "\e[?25l"; 
printf %b "\n\tinstall some cool shit\e[0m? [\e[2mY\e[0m/\e[2mn\e[0m] "; 
read -n1 -sr "ny"; if [ -z "$ny" ]; then 
###
hash sudo 2>/dev/null && sudo="sudo"; 
[ $UID = 0 ] && unset sudo; zz="${zz-$HOME/zz}"; 
hash git || $sudo apt install -y git &>/dev/null; 
printf %b "\n $o downloading ... \n"; 
cd $zz; . $zz/setup/.menu.sh; menu_setup "./setup"; 
################
else echo;echo; fi; printf %b "\n\e[1;5m\t>_<\n\n\e[0m"; 
