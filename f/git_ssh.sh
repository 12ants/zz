git_ssh() { local FZF_DEFAULT_OPTS=; gggg="$(ls ~/.ssh|grep -vE '.pub|known_hosts|authorized_keys'|fzf --preview '(cat ~/.ssh/{}.pub|tr " " "\n"; echo; echo; cat ~/.ssh/{})|bat -ppflgo' -i --wrap --preview-window 'wrap' --wrap-sign '' --bind 'q:abort')"; 

printf %b "\n\n\e[A -- change git ssh-key to: $gggg ? [Y/n] "; read -sn1 ny; [ -z "$ny" ] && git config set core.sshCommand "ssh -i ~/.ssh/$gggg"; echo; 


cat .git/config | sed -e "s/url\ \=\ https\:\/\/github.com\//url\ \=\ git@github.com:/"; 
printf %b "\n\n\e[A -- change git.config to this ? [Y/n] "; read -sn1 lk; [ -z "$lk" ] && git config set core.sshCommand "ssh -i ~/.ssh/$gggg"; echo; 

sed -i$(date +%m%d%H%M%S) -e "s/url\ \=\ https\:\/\/github.com\//url\ \=\ git@github.com:/" .git/config; 
echo; 
}; 
