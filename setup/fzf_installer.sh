#!/bin/bash
hash sudo 2>/dev/null&& sudo=sudo; 
mkdir ~/gh 2>/dev/null; 
mkdir ~/bin 2>/dev/null; 
hash git 2>/dev/null||$sudo apt install git; 
####
git clone --depth 1 https://github.com/junegunn/fzf.git ~/gh/.fzf; 
~/gh/.fzf/install --all --no-fish --no-zsh; 
####
####
