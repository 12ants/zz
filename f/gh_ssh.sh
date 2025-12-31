#!/bin/bash
gh_ssh() { 
git config --get remote.origin.url|grep -e "https://" && gg="$(git config --get remote.origin.url|sed -e 's/https:\/\/github.com\//git@github.com\:/')" && git config remote.origin.url ${gg}.git; git config --list|bat -ppflc; 
}; 
