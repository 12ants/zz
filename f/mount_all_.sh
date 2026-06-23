#!/usr/bin/env bash
#!/usr/bin/env bash
################### list and mount drives
################### 12ants.github.io
################### 
################### 
mount_all () { 
################### 
IFS=$'\n\t\ '; 
################### 
hash sudo 2>/dev/null && sudo=sudo; 
################### 
################### 
d_all=($($sudo fdisk -lo Device,Size,Type,Attrs,Name | grep --color=auto -v "loop" | grep --color=auto -e "dev" | sed -e "s/Disk/\n&/g" -e "s/..[0-9]*\ bytes.*//g"|grep -vE 'Disk |BIOS|EFI'|cut -d' ' -f1|sed '/^$/d')); 
####
####
d_mnt=($(df|grep -vE 'tmpfs|none|loop.*|Filesystem'|cut -f1 -d' ')); 
d_unm=($(printf %b "${d_all[*]}"|grep --color=always "${disks_mounted[*]}")); 
####
# printf %b "disks_mounted\n--\n${disks_mounted[*]} \n_\n${disks[*]}\n"; 
####
printf %b "--------\ndisks in color are mounted\n"; 
printf %b "${d_all[*]}"|grep --color=always "${d_mnt[*]}" -C9 || printf %b "${d_all[*]} "; 
####
printf %b "\n\n\n\n\e[4Amount all unmounted? [\e[1mY\e[m/n] "; 
read -sn1 "y"; [ -z $y ] && y=y; 
if [ "$y" = y ]; then 
for i in ${d_unm[*]}; do $sudo mount ${i} ${i/*\///media/} 2>/dev/null && printf %b "[$i] mounted @ ${i/*\///media/}\n"; done; printf %b "done"; else printf %b "ok"; fi; echo; 

}; 
mount_all_
