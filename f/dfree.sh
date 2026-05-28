dfree() { 
local IFS=$'\n\t '; 
if [ $PREFIX ]; 
then df=($(df -h|rg -v "00000000"|rg -e "sdcard/default|storage|Size"|tr -s " " " "|cut -f1,2,4,5 -d" ")); 
else df=($(df -h|rg -v "efi|tmpfs|\*tmpfs|9p|fonts|none|run|\ 0\ "|tr -s " " " "|cut -f1,2,4,5 -d" ")); 
fi; 
plup='■'; 
aa=0; kk=0; a=0; as=1; dflines="$((${#df[*]}/4))"; 
dk=(028 114 151 152 247 143 220 209 200 196); 
#####
#####
for i in ${df[*]}; do \
for a in {0..4}; do \
disk="$(printf %b "${df[((a+aa))]}")"; 
[ ${disk} ] && printf %b "${disk} "|bat -ppflc --theme zenburn;  
((kk++)); done; 
####
[ $((kk / 6 - 1)) -lt $dflines ] && \
[ $aa -gt 0 ] && (sa="${df[((a+aa))]}"; 
####
[ ${#sa} -gt 1 ] && as=${sa:0:1}; 
####
#### percent in number
for i in $(seq $as); do printf %b "\e[38;5;${dk[as]}m0\e[0m"; done; 
for i in $(seq $((10 - as))); do printf %b "\e[38;5;245mO\e[0m"; done); 
####
aa=$kk; printf %b "\n"; done | 
column --separator=" " --table --table-columns-limit 7 \
--output-separator "$(printf %b "\e[37;2m | \e[0m")" --table-columns "Filesystem,Size,Used,Avail,Use%,Mounted,on"; 

# --table-order "6,2,1";
# | bat -ppfljava; 
}; 


