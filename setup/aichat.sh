#!/bin/bash
## dl aichat
if [ "$PREFIX" ]; then apt install aichat -y; else 
wget -L "https://github.com/sigoden/aichat/releases/download/v0.30.0/aichat-v0.30.0-x86_64-unknown-linux-musl.tar.gz"; 
tar -xvf ./aichat-v0.30.0-x86_64-unknown-linux-musl.tar.gz; 
rm ./aichat-v0.30.0-x86_64-unknown-linux-musl.tar.gz; 
mv ./aichat -t $HOME/bin/; 
####
fi; 
mkdir $HOME/.config/aichat 2>/dev/null; 
ln -s $HOME/zz/c/aichat/* -t $HOME/.config/aichat
gpg --pinentry loopback -o $HOME/.config/aichat/config.yaml -d $HOME/.config/aichat/config.yaml.gpg; 
####
