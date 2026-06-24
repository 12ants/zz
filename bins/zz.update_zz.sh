#!/usr/bin/env bash
# update zz
zz.update_zz () { 
zz="${zz:=$HOME/zz}"
####
cd $zz/f; 
for i in *.sh; do o="${i/%.sh/}"; tail -n1 $i|grep -v "${o}" && sed "\$a$o" -i $i; done; 
for i in *.sh; do grep -q '#!/usr/bin/env' $i || sed -e '1s/\#\!\/bin\/bash//' -e '1i\#!/usr/bin/env bash' -i $i; printf %b "$i "; done;
cd $OLDPWD; 
####
. "${HOME}"/zz/setup/add_own_bins.sh; 
. "${HOME}"/zz/setup/config_files.sh; 
####
####
mkdir ${HOME}/gh 2>/dev/null; 
####
[ -d "${HOME}/gh/appi" ] && cd ${HOME}/gh/appi || gh repo clone appi;
[ -e "pp" ] && pp
####
cd $OLDPWD; 
####
}; 
zz.update_zz 
