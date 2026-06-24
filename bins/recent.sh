#!/usr/bin/env bash
recent() { find ${1-~} -type f -printf '%T+ %p\n' | sort -n|sed -e "s/\..*\ /\ \ /" -e "s/\+/\ \ /" -re "/(config|git|logs|tmp|lesshst|bash_history)/d"|tail -n28|bat -ppfljs; };
recent
