12cuda() { IFS=$'\n' ff=($(IFS=$'\n' ls=($(command ls -sShp --color=never|sed -e 1d)); 
#########
printf %b "${ls[*]}"|column --columns 222222 --table --output-separator "  " --table-order 2|bat -ppfljs --theme zenburn|fzf --ansi --color 'bg:234,gutter:149,hl+:128,hl:196,preview-bg:233,border:162,preview-border:66,separator:86' -h "$((${#ls[*]} + 3))" -w "$(($(printf %b "${ls[*]}"|wc --max-line-length) + 144))" --preview-window 'right,126' --border thinblock --preview 'printf %b "\e[48;5;24m"; realpath {1}; echo; file -sb --brief {1}|bat -ppflc++; '|sed -e 's/\ .*//g')); 
####
# IFS=$'\n\t '; 
#############
printf %b "${ff[*]}"; 
for i in ${ff[*]}; 
do 
printf %b "\n$i\n"; 
ffmpeg -hwaccel cuda -hwaccel_output_format cuda -i ${i} -c:v h264_nvenc -preset slow ${i%.*}.mp4; 
printf %b "\--------\n"; 
done; 
}; 
