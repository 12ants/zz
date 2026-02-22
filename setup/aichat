#!/bin/bash
## dl aichat
gh repo clone sigoden/aichat $HOME/gh/aichat; 
cd $HOME/gh/aichat; 
gh release download --pattern "*86_64-unknown*"; 
gzip -d aichat-v0.30.0-x86_64-unknown-linux-musl.tar.gz; 
tar -xf aichat-v0.30.0-x86_64-unknown-linux-musl.tar; 
rm aichat-v0.30.0-x86_64-unknown-linux-musl.tar; 
ln -s $PWD/aichat -t $HOME/bin; cd $OLDPWD; 
mkdir $HOME/.config/aichat 2>/dev/null; 
ln -s $HOME/zz/c/aichat/* -t $HOME/.config/aichat
gpg --pinentry loopback -o $HOME/.config/aichat/config.yaml -d $HOME/.config/aichat/config.yaml.gpg; 
