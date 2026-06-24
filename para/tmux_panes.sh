(sleep 1; tmux display-panes) & &>/dev/null disown; printf %b "\e[A\e[K"; 

pane="$(tmux list-panes|fzf --bind 'start:pos:0,load:execute-silent:tmux display-pane')"; 

# tmux
