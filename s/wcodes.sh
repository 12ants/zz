#!/bin/bash
## weather codes
declare -a wc=(codes)
wc[1]="Clear sky"; 
wc[2]="Nearly clear sky"; 
wc[3]="Variable cloudiness"; 
wc[4]="Halfclear sky"; 
wc[5]="Cloudy sky"; 
wc[6]="Overcast"; 
wc[7]="Fog"; 
wc[8]="Light rain showers"; 
wc[9]="Moderate rain showers"; 
wc[10]="Heavy rain showers"; 
wc[11]="Thunderstorm"; 
wc[12]="Light sleet showers"; 
wc[13]="Moderate sleet showers"; 
wc[14]="Heavy sleet showers"; 
wc[15]="Light snow showers"; 
wc[16]="Moderate snow showers"; 
wc[17]="Heavy snow showers"; 
wc[18]="Light rain"; 
wc[19]="Moderate rain"; 
wc[20]="Heavy rain"; 
wc[21]="Thunder"; 
wc[22]="Light sleet"; 
wc[23]="Moderate sleet"; 
wc[24]="Heavy sleet"; 
wc[25]="Light snowfall"; 
wc[26]="Moderate snowfall"; 
wc[27]="Heavy snowfall"; 
####
curl -sL "https://opendata-download-metfcst.smhi.se/api/category/snow1g/version/1/geotype/point/lon/16.158/lat/58.5812/data.json?timeseries=12?parameters=air_temperature,symbol_code,wind_speed" -o "$HOME/logs/tmp/wc.json"


cat wc.json |tr -s "[]{}," "\n\"\n"|tail -n+10|grep -vE "inter|data"|sed -e "s/\:00\:00Z//g"|cut -f2- -d":"|sed -e "s/T/Twt[/g"|cut -f2 -d"T"|tr "\n\"" " _"|sed -e "s/_\ /]=(/g" -e "s/\.00 /);\n/g"; 
