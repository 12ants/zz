#!/usr/bin/env bash
unset -f ai; ai() { 


local IFS=$' \n\t'; unset -v msg tmpai to; mkdir -p "$HOME"/logs/ai 2>/dev/null; [ -z "$1" ] && read -rp 'ask vibe: ' "msg"; msg="${msg:-$*}"; tmpai="${TMPDIR:-${HOME}}/${msg//\ /_}.md"; touch "$tmpai"; to="${HOME}/logs/ai/${msg//\ /_}.md"; vibe --output text -p "${msg}"|tee "${tmpai}"; printf %b " -- save answer to [$to]? [Y]es | [n]o | [c]hange "|bat -ppfljs; read -srn1 y; case "$y" in n) echo; return;; c) read -erp "to: " -i "${PWD}" "to"; cp --backup "${tmpai}" "${to}";; *) cp --backup "${tmpai}" "${to}"; esac && printf %b "\n -- saved to: ${to}\n"; 


}; 
ai
