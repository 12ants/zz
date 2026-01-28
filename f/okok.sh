okok() { echo; [ $1 ] && kk="$*"||kk="ok"; figlet -tc "${kk}"|bat -ppfld|grep -e '█' --color -C6; }; 
