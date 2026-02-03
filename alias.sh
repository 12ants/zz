#!/bin/bash
# alaaaaais
alias zz='cd $HOME/zz'; 
c2='\e[96m --\e[0m'; re='\e[0m'; gt=""; 
[ -z "$PREFIX" ] && sudo=sudo; 
# alias kk='fmt -g 66|col -xb|bat -pfljava --theme DarkNeon'; 
alias kkkk='col -xb|fmt --split-only --width=$((COLUMNS - 2)) --goal=66 --uniform-spacing --tagged-paragraph|bat -pfljava --theme TwoDark'; 
alias rep="reset -Q; IFS=$'\n\t '; . $PREFIX/share/bash-completion/bash_completion"; 
alias cccc='crontab -e'; 
alias xxxx='ssh -p 8022 aa@192.168.0.19 "mpv $HOME/88/m/money.mp3"'
alias gh_release_dl='gh release download "$(gh release list --limit 1|tail -n1|tr -s " \t" " "|cut -f1 -d" ")"'; 
alias zz.alias='$EDITOR ~/88/alias.sh'; 
alias zz.disk='$sudo fdisk -lL=always|grep -vwE "sectors|Sector|I/O"|cut -f2- -d'; 
alias env='env|sort|k'; 
alias antsup='ssh aa@ants.ftp.sh "sudo apt update; sudo apt upgrade; sudo reboot"'; 
alias s='ssss -sl4|grep -vE "UNCONN"|tr -s " " " "|cut -f1,2,5 -d" "|column --table --output-separator " : "|bat -ppfld'; 
alias neew='clear; . crons/hour.sh; printf %b "\e[12B"; new'; 
alias ss='history -s "$(printf %b "sudo "; tail -n1 "$HISTFILE")"; history -w; read -ei "$(tail -n1 "$HISTFILE")" "ssss" && ${ssss} || echo ok; '; 
alias 88='cd ~/88; echo; realpath ~/88|bat -ppfljava; echo; ls --color=always -GghtrAp --group-directories-first; echo; git status'; 
alias 88pullpush='git add ./; git commit -a -m "${USER}_${mod//\ /}_$(date)" -v; git pull; git push; ls --color=always -trAmp --group-directories-first'; 
# li=$(($(ps -A|wc -l)+6)); [ ${li} -gt ${LINES} ] && li=${LINES}; 
alias gitstats='[ -e $PWD/.git ] && (printf %b "$(git status --short| bat -ppfld --theme Coldark-Dark)\n");';
alias zz.choose_logins_screen='
printf %b "$re\n\n\n\n\n\e[4A"; 
systemctl get-default; 
printf %b "\n $c2 [\e[94mg\e[0m]raphical / [\e[95mt\e[0m]erminal "; 
read -en1 "gt"; 
case $gt in 
g) sudo systemctl set-default graphical.target;; 
t) sudo systemctl set-default multi-user.target;; 
*) return 1;; esac; 
'
# alias weather='curl -L "wttr.in/stockholm?format=4"'; 
# alias wtr='gum style --border normal --border-foreground "#25554b" --padding "1 2" --margin "1 2" "$(weather -s)"'; 
alias fig='figfonts'; 
alias la='lsd -l --icon never --group-directories-first --classify --total-size -a --blocks user,size,date,name --date +%H:%M:%S'
alias bb='if [ "$PREFIX" ]; then \
tmux display-popup -E -w 99% -h 98% "htop"; else \
tmux display-popup -E -w 99% -h 98% "btop"; fi '
alias qb='ssh aa@ants.ftp.sh "qbittorrent-nox -d" && xdg-open https://qb.aeniks.com'; 
alias l='lf -last-dir-path $HOME/logs/ll.log; cd $(cat $HOME/logs/ll.log); '
alias jacketts='/home/aa/gh/jackett/jackett &'
alias uu="tmux split-window -l 44% -e sudo='$sudo' 'hash nala||$sudo apt install nala -y &>/dev/null; $sudo nala update; $sudo nala upgrade -y; '"; 
alias upup='$sudo apt update; $sudo apt upgrade -y'; 
alias wtr='curl -sL "https://wttr.in/sthlm?format=4"';
# alias u2='tmux split-window -l "44%" -e "sudo=$sudo" -v '$sudo apt update 2>/dev/null|bat -ppflzig --theme=DarkNeon; printf %b "\n\n\n\n\e[96m"; $sudo apt upgrade -y; $sudo apt autoremove -y; printf %b "\n\e[0;46m\n\n\n\n -- done\n\n\n\n\e[0m\n"; read -n1 "kk"; ';'; 


alias ffff='[ -z $PREFIX ] && neofetch || [ $PREFIX ] && fastfetch --percent-type 2 --logo-position right --logo-padding 2 --bar-border-right "" --bar-border-left "" --disable-linewrap';
alias mm='micro'; 
#!/bin/bash
## aaaaaa
alias upwords='rsync aa@ants.ftp.sh:/home/aa/logs/words/up -avP --mkpath ~/'; 
# alias yno='nyo'; 
alias zz='cd $HOME/zz'; 
# alias zz='col -b|tr -s "\n\t " "\n\t "|bat -pfljava --pager "more"'; 
alias f='[ -e $PREFIX/bin/fastfetch ] && fastfetch || neofetch || return 0'; 
# alias f='fff; cd $(cat $HOME/.cache/fff/.fff_d)'; 
alias sshaa='mosh aa@ants.ftp.sh||ssh aa@ants.ftp.sh'; 
alias zz.moshants='sshaa'; 
alias zz.path='$EDITOR $HOME/.config/path.sh; '; 
alias path_change='$EDITOR $HOME/.config/path.sh; '; 
alias patchshow='echo $PATH |tr ":" "\n"|batcat -ppf --language perl --theme OneHalfDark'; 
# export LESS='-R --file-size --use-color  --incsearch --prompt="(%T) [/]search [n]ext-match [p]rev-match ?f%f .?n?m(%T %i of %m) ..?lt %lt-%lb?L/%L. :byte %bB?s/%s.  .?e(END)  ?x-  Next\:   %x.:?pB  %pB\%..%t "'; 
alias mmmmmm='ssh -p 8022 192.168.0.19 "mpv start/media/money.mp3"'; 
alias sd='cd /sdcard';
alias mm='$EDITOR '
alias qq='cd .. ';
alias rr='sudo -s';
alias k='col -xb|tr -s "\n" "\n"|bat -pfljava'; 
alias re='reset -Q; exec bash;'; 
# alias ll='ls -l --group-directories-first -tr'; 
# alias ll='lsd -l --extensionsort --group-directories-first -tr'; 
alias ll='ls -hk -Gltr --color=always'; 
alias ipme='wget https://icanhazip.com -qLO-'; 
alias quotesfortune='fortune $s|tr -s "\t" " "'
alias reloadbash='clear; exec bash '; 
alias sd2='cd /storage/B371-E27C'; 
alias figz='figlist=($(figlist|batcat -pp --line-range 4:|head -n-5)) '; 
alias gpg='gpg --pinentry loopback';
# alias ff='[ -e $PREFIX/bin/fastfetch ] && fastfetch || neofetch'
alias ipme4='curl https://icanhazip.com -s4'; 
alias no='printf "\e[?25h\e[0m"; tmux set mouse on 2>/dev/null; reset -I 2>/dev/null;'
alias r='ranger --choosedir=$HOME/logs/path; cd $(cat $HOME/logs/path)'; 
alias l='lf -config $HOME/.config/lf/lfrc -last-dir-path $HOME/logs/ll.log; cd $(cat $HOME/logs/ll.log); '; 
alias kat='bat -pfld|less'; 
# alias kk='bat -pflzig'; 
# alias kk='bat -ppflzig $(tmux set-option mouse off; )|less; tmux set-option mouse on; '; 
alias iiii='$EDITOR $HOME/.inputrc; echo gg; exec bash; '
alias speed='speedtest --bytes --no-upload 2>/dev/null || speedtest-go --unit=decimal-bits \
--no-upload || speedtest-cli 2>/dev/null; '
########
alias zz.install_nvm='. $start/config/nvm.sh'
alias zz.nvm_init='export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" \
|| printf %s "${XDG_CONFIG_HOME}/nvm")"; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; ';
alias logs='cd $HOME/logs'; 
alias zz.nvm_init2='[ -s "$NVM_DIR/nvm.sh" ]&& . "$NVM_DIR/nvm.sh";
[ -s "$NVM_DIR/bash_completion" ]&& . "$NVM_DIR/bash_completion"'
NVM_DIR="$HOME/.nvm"; 
#######

# alias dfree2='printf %b "\e[0;2m$(df -h|head -n1|tr -s " " "\t"|batcat --theme=Nord -ppflc++; )\e[0;1m\n"; df="/dev"; [ $PREFIX ]&& df="/dev/fuse"; df -h|tr -s " " "\t"|grep -v "100%"|grep -v "tmpfs"|grep -v "none"|grep -v "run"|grep -v "efivars"|grep -v "boot"|grep -v loop|grep -e "$df"|batcat --theme=Dracula -ppflc++';
########
alias tldr='man -s tldr'; 
# unalias zz.info 2>/dev/null; 

#
# 12info() { local FZF_DEFAULT_OPTS="-m -i --cycle --ansi --inline-info --bind "q:abort" --height "~99%" --color "list-bg:233" --highlight-line"; lsw="$((COLUMNS - $(ls -w2 $HOME/88/i|wc --max-line-length) - 4))";in12=$HOME/88/i/$(ls -w2 $HOME/88/i|fzf --preview "bat -ppfljava $HOME/88/i/{}" --preview-window "noborder,right,${lsw},wrap" --wrap-sign "" --bind "o:execute(tmux display-popup -w 98% -h 98% -E 'micro $HOME/88/i/{}')";) && case ${in12:(-2)} in md) glow $in12;; *) bat -pf $in12;; esac || echo gg; }; 

# fzf --bind 'focus:transform-header:file --brief {}'


# Integration with ripgrep
alias fzfrg='\
RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "; 
INITIAL_QUERY="foobar"; 
FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'"; 
fzf --bind "change:reload:$RG_PREFIX {q} || true" --ansi --disabled --query "$INITIAL_QUERY"; '; 


                  


alias zz.info_tput='batcat -pf "$start/info/tput.nfo"; ';
alias zz.info_ansi='batcat -pf "$start/info/ansi.md"; ';
alias zz.info_bash='batcat -pf "$start/info/bash.md"; '; 
alias zz.tmux_on='chmod 775 $HOME/.config/tmux_state; echo "on!"';
alias zz.tmux_off='chmod 600 $HOME/.config/tmux_state; echo "off!"';
alias zz.edit-alias='$EDITOR ~/start/alias.sh'
alias zz.edit-termux='$EDITOR ~/.termux/termux.properties'
alias zz.edit-input='$EDITOR ~/.inputrc'
alias zz.edit-lf='$EDITOR ~/.config/lf/lfrc'
alias zz.edit-bashrc='$EDITOR ~/.bashrc'
alias zz.edit-tmuxlocal='$EDITOR ~/.tmux.conf.local'
alias zz.edit-anews_start='$EDITOR ~/start/anew.sh'
alias zz.mems='gum style --border normal --border-foreground 24 --padding "0 1" "$(free -h|sed -e "1s/\ \ \ \ \ /RAM: /" -e "2,3s/i/b/g"|column --table --table-right 2-9 --output-separator "   "|batcat -ppflc++ --theme Visual\ Studio\ Dark+ )"'; 

####
alias coolors='echo; for i in $(seq --equal-width 255); do printf "\e[48;5;${i}m ${i} \e[7m\e[30m ${i} \e[0m"; done; '; 
####
alias push='git add --all; git commit --all -m $(id -nu; date +%F_%H_%M); git push -v|batcat -ppflzig'
# alias pp='push'
alias pp='git add ./; git commit -a -m "${USER}_${modo//\ /}_$(date)" -v; git pull --verbose; git push --verbose; ls --color=always -trAp --group-directories-first'; 
alias pull='git pull --verbose'
alias pppp='git pull|batcat -ppflzig'; 
alias uuuu='$sudo apt update 2>/dev/null| \
bat -ppflzig --theme=Nord; $sudo apt upgrade -y; \
$sudo apt autoremove -y 2>/dev/null | \
bat -ppflc --theme=1337; 
sudo apt update &>/dev/null|tail -n1 > $HOME/logs/aptup.log && \
printf %b "\n -- done\n\n"'; 
# alias uu='uuuu'; 
alias rb='$sudo reboot'; 
open() { [ $PREFIX ] && termux-open $@ || xdg-open $@; }; 
alias open-url='termux-open-url'; 
alias path='$EDITOR ~/.config/path.sh'; 
# alias ff='fastfetch -l small --logo-position top --logo-padding-right 1||neofetch';

alias zz.paint='pa=($(pastel list|sed -n $((RANDOM%139))p)); pan=$(pastel format ansi-8bit $pa;); printf %b "\n$pan\n"; figlet -tWXc -f 3d $pa; printf %b "\n  "; ph=$(pastel format hex $pa;); phs=$(pastel format hsl $pa;); pac=$(pastel complement $pa;); 
printf %b "\e[0m\n  $pa \n  $phs \n  $ph \n";printf %q "  $pan"|tr -d "\\\\";printf %b "\n\n"'

# alias zz.install_cloudpanel.io='echo; (echo; curl -sL https://cloudpanel.io/docs/v2/getting-started/other|html2text|grep -e "curl -sS" -A3 -m1; echo; )|tee $HOME/cloudpanel_installer.sh; chmod 775 $HOME/cloudpanel_installer.sh; printf %b "\n\n\n\n\e[2A"; read -e -n1 -sp "continue? [Y/n] " "ny"; [ $ny ]||. $HOME/cloudpanel_installer.sh; echo "gg"; '; 
# alias tmk='tmux display-popup -w 99% -h 99% -E "echo loading; tmux list-keys|grep -v "copy-mode-vi"|col -xb|tr -s "\n" "\n"|tr -s "\t " " "|pr --omit-header|column --table --table-columns-limit 5 --table-hide 1|sed -e "a--------"|bat -pfljs; "'; 
# alias l='cd $(lf -config $HOME/.config/lf/lfrc -print-last-dir); grep -e "/" \
# "$HOME/.local/share/lf/files" 2>/dev/null'; 
alias tmuxkeys='tmux list-keys|grep -v "copy-mode-vi"|col -xb|tr -s "\n" "\n"|tr -s "\t " " "|pr --omit-header --page-width $((COLUMNS))|column --table --table-columns-limit 5 --table-hide 1|sed -e "a\\\x1b[0m-\x1b[222b"'; 
########
alias hellllo='printf %b "\n\n\n\n\n\n\e[6A\e[?25l"; for i in {1..28}; do printf %b "\e[s\e[38;5;$((RANDOM%229))m \e[s\e[98;5;$((RANDOM%22))m\n"; figlet -o -f sub-zero "hello"; sleep .12; printf %b "\e[u"; done; printf %b "\e[?25h"; printf %b "\n\n" '; 
alias toppo="top -b -n1 -s2 -H -o s,%mem,%cpu,args" 
zz.gh.clone() { 
[ -z "$1" ] && echo && read -rep ' -- repo: ' 'ghc' || ghc="$1"; gh repo clone "$ghc" $HOME/gh/"$ghc"; cd "$HOME"/gh/"$ghc"; ls -lGgp --color=always; }; 
alias zz.sysinfo='fastfetch -c ~/zz/c/fastfetch/fastfetch66.json'; 

nam() { kk=$(for i in $(seq $(stty size|cut -f2 -d" ")); do printf %b "-"; done); man $@|col -xb|sed -e "s/^[ ]*//g" -e "s/^$/$kk/g"|bat -pfljava --theme DarkNeon; }; 

zz.appa() { 

zz.appa.get() { printf %b "\n\n\e[A -- getting list ... \n"; $sudo apt list --verbose 2>/dev/null|tail -n+2|sed -e 's/\/.*\ \[installed.*/\__/g' -e 's/$*\/.*//g' -e '/^$/c#'|tr -d "\n"|tr -s "#" "\n"|sed -e 's/__/\ \x1b[42;1;30minstalled/' -e '/^lib*/d' -e "s/[\']//g"|sed -e 's/$/\x1b[96m/g' -e 's/\ \ /\x1b[0m\ /g' | tee $HOME/logs/appa.log; }; 


[ -e $HOME/logs/appa.log ] || zz.appa.get; 
(($(date +%s) + 80000 < $(stat -tc%W $HOME/logs/appa.log))) && \
printf %b "\n -- old apt list ... getting a new one \n\n" && \
zz.appa.get; 

appa=($(cat $HOME/logs/appa.log | command fzf --ansi -i --preview \
'apt show {1} 2>/dev/null|grep -vE "Download-Size|Version|Maintainer|APT-Sources"|sed -e "s/Description\:\ /------\n/"' \
--preview-window 'wrap,top,noborder,12' \
--no-border \
--bind 'change:first' \
--color 'bg:59,preview-bg:232' --info inline | \
sed -e "s/\s.*//")); 
####
[ "${appa}" ] && \
printf %b "\n\n\e[A\e[0m 
\e[96m----\e[0m
${appa[*]}
\e[96m----\e[0m
\e[2m[\e[0mI\e[2m]\e[0mnstall :: \e[2m[\e[0mR\e[2m]\e[0memove :: \e[2m[\e[0mQ\e[2m]\e[0muit \n\n" && \
read -rsn1 "nn"; 
case $nn in i|I) $sudo apt install -y ${appa[*]} && \
$sudo apt -y autoremove;; 
r|R) $sudo apt remove -y ${appa[*]} && $sudo apt -y autoremove;; 
*) printf %b "\n\n\e[A -- ok\n\n"; return 0;; esac; 
echo; 
####
}; 
