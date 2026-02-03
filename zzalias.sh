#!/bin/bash
## zz.commands
alias zz='cd $HOME/zz; pwd; ls -p --color=always'; 
alias zz.ssh.ants='ssh aa@ants.ftp.sh'; 
alias zz.path.edit='$EDITOR $HOME/.config/path.sh'; 
alias zz.tmux.on='chmod 775 $HOME/.config/tmux_state; echo "on!"';
alias zz.tmux.off='chmod 600 $HOME/.config/tmux_state; echo "off!"';
alias zz.disk='$sudo fdisk -lL=always|grep --color=always -vwE "sectors|Sector|I/O"|cut -f2- -d'; 
alias zz.memory='gum style --border normal --border-foreground 24 --padding "0 1" "$(free -h|sed -e "1s/\ \ \ \ \ /RAM: /" -e "2,3s/i/b/g"|column --table --table-right 2-9 --output-separator "   "|batcat -ppflc++ --theme Visual\ Studio\ Dark+ )"'; 
alias zz.color.random='pa=($(pastel list|sed -n $((RANDOM%139))p)); pan=$(pastel format ansi-8bit $pa;); printf %b "\n$pan\n"; figlet -tWXc -f 3d $pa; printf %b "\n  "; ph=$(pastel format hex $pa;); phs=$(pastel format hsl $pa;); pac=$(pastel complement $pa;); 
