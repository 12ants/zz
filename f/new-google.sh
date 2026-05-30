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
printf %b '<!DOCTYPE html><html lang="en"><head><meta charset="utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/><title>hello</title><style>body {font-family: monospace;font-size: 1em;width: 100vw;height: 100%;margin: 2px;overflow-x: hidden;justify-content: space-between;display: flex;flex-direction: row;flex-wrap: wrap;}a{padding: 2px;text-decoration: underline dashed #44bbffcc;color: #004466;font-weight: 600;}pre { white-space: pre-line; width: fit-content; margin: 4px 22px 22px 4px; text-decoration: none; outline: solid 2px #222222; border-bottom: solid 4px; padding: 4px; background: #ff228822;}</style></head><body>' > ${pos}/google_${sub}_${time}_.html; 
# 
cat ${pos}/google_${sub}_${time}_.xml | sed -e "s/<*>/&\n/g" | sed -n "/<pubDate>/,/<\/description>/p"|sed -e "s/\&lt\;/</g" -e "s/\&gt\;/>/g" -re 's/(nbsp|&amp)\;//g' -e "s/<description>/<pre>/g" -e "s/<\/description>//g" -e "s/<pubDate>/\ -\ /g" -e "s/\/pubDate>/\/pre>____/g" -e "s/<\/a>/&\ -\ /g" -e "1,2d"|tr -d "\n"|sed -e "s/____/\n\n/g" >> ${pos}/google_${sub}_${time}_.html; 
##
lynx -dump -nolist -nonumbers -width="444" ${pos}/google_${sub}_${time}_.html |head -n2|tee ${pos}/latest.log; 
}; 

