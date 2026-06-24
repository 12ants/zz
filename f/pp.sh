#!/usr/bin/env bash

####
unalias pp 2>/dev/null; 
####
pp () { 
git add ./; git commit -a -m "${USER}_${modo//\ /}_$(date)" -v; 
git pull --verbose; 
git push --verbose; 
ls --color=always -trAp --group-directories-first; 
####
}; 
pp
