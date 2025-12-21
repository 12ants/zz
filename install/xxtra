#!/bin/bash
## install pastel 
if [ "$PREFIX" ]; then apt install pastel; else 
wget "https://github.com/sharkdp/pastel/releases/download/v0.11.0/pastel_0.11.0_amd64.deb" -O $HOME/tmp/pastel_amd64.deb; 
####
hash sudo && sudo=sudo; 
$sudo dpkg -i $HOME/tmp/pastel_amd64.deb; 
fi; 
