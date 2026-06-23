#!/usr/bin/env bash
send() { send="$*"; [ -z "$send" ] && printf %b "\n\n\e[A -- send:" && read -rep ' ' "send"; curl "ntfy.sh/oioioioi" -d "$*"; }; 
send
