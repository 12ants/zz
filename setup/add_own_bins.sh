#!/usr/bin/env bash
# link [~/zz/f/*] to [~/bin/]; 
zz_setup_ln_bin() { 
local IFS=$' \n\t'; 
local VERSION_CONTROL="numbered";
####
mkdir "${HOME}"/backups 2>/dev/null; 
####
zz="${zz:-${HOME}/zz}"; 
####
f=($(ls ${zz}/f)); 
mkdir -m 775 "${HOME}/bin" 2>/dev/null; 
####
for i in ${f[*]}; do 
####
to="${HOME}/bin/${i/.sh/}"; 
[ -e "${to}" ] && mv -b "${to}" -t "${HOME}/backups"; 
ln -s ${zz}/f/${i} ${to}; 
####
done; 
####
}; 

zz_setup_ln_bin; 
