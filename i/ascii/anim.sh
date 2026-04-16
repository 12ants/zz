#!/bin/bash
# anim
(printf %b "printf %b '\\\\e[2K\n"; 
sed owla.sh \
-e "s/'/\\\\x27/g" \
-e "s/^/\\\\e[2K/g" \
-e "s/.*newline/'; \nread -sn1 -t.5; \nprintf %b '\\\\e[4A /g" \
-e "s/.*endline/'\n/g")\
|tee 2a.sh; 
