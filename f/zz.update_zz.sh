#!/usr/bin/env bash
# update zz
zz.update_zz () { 
cd $HOME/zz/f; 
for i in *.sh; do o="${i/%.sh/}"; tail -n1 $i|grep -v "${o}" && sed "\$a$o" $i; done; 

. "${HOME}"/zz/setup/add_own_bins.sh; 
. "${HOME}"/zz/setup/config_files.sh; 

cd $OLDPWD; 
}; 
zz.update_zz 
