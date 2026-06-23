#!/usr/bin/env bash
msg() { echo -e "\e[0;2m----------------\e[0m"; msgurl="ntfy.sh/oioioioi"; msg="$*" && [ "$msg" ] || read -rp "message: " msg; curl "${msgurl}" -d "${msg}" &>/dev/null && echo -e '\e[A\e[Kmessage sent to: "'$msgurl'" \e[96m@\e[0m '$(date +%x)' \n\e[2m----------------\e[0m\n'$msg'\n\e[2m----------------\e[0m'; }
