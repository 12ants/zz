#!/bin/bash
##
news_google() {
sub=${1-ai}; 
pos="${HOME}/logs/news"; 
mkdir -p ${pos} 2>/dev/null; 
time="$(date +%y%m%d%H%M%S)"; 
hash lynx 2>/dev/null || $sudo apt in lynx -y 2>/dev/null; 
# /google_${sub}_${time}_"; 
##
curl -sL "https://news.google.com/rss/search?q=${sub}" > ${pos}/google_${sub}_${time}_.xml
##
cp ${pos}/temp.html ${pos}/google_${sub}_${time}_.html; 
# 
cat ${pos}/google_${sub}_${time}_.xml | sed -e "s/<*>/&\n/g" | sed -n "/<pubDate>/,/<\/description>/p"|sed -e "s/\&lt\;/</g" -e "s/\&gt\;/>/g" -re 's/(nbsp|&amp)\;//g' -e "s/<description>/<pre>/g" -e "s/<\/description>//g" -e "s/<pubDate>/\ -\ /g" -e "s/\/pubDate>/\/pre>____/g" -e "1,2d"|tr -d "\n"|sed -e "s/____/\n\n/g" >> ${pos}/google_${sub}_${time}_.html; 
##
lynx -dump -nolist -nonumbers -width="444" ${pos}/google_${sub}_${time}_.html |head -n5|tee ${pos}/latest.log; 
}; 

