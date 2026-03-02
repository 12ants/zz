since="$(($(date +%s) - $(stat $HISTFILE -c %Z)))"; [ $since -gt 12 ] && (date; echo "hello") >> /home/aa/logs/screensaver.log
