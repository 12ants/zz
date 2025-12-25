#!/bin/bash
# curl -L "https://wttr.in/stockholm?format=4" > ~/logs/wtr.log; 
curl -sL https://wttr.in/sthlm?format="(%t/%f/%C)+(%w_%p)+in+%l"|tr -s "[:upper:]" "[:lower:]" > ~/logs/weather.log && date +\ @\ %H:%M\ %y/%m/%d >> ~/logs/weather.log; 
