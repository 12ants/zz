#!/bin/bash
# phoneeee
ssh -p 8022 aa@192.168.0.19 "for i in {1..15}; do termux-volume notification 1; termux-tts-speak -p .1 -r .1 -s "NOTIFICATION" "$i"; done"
