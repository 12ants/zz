#!/bin/bash
## install grub
$sudo cp $HOME/zz/m/tard.jpg /boot/grub/tard.jpg 2>/dev/null; 
$sudo mv /etc/default/grub /etc/default/grub_$(date +%y%m%d_%H%M) 2>/dev/null; 
printf 'GRUB_BACKGROUND="/boot/grub/tard.jpg"
GRUB_MENU_BACKGROUND="/boot/grub/tard.jpg"
GRUB_MENU_PICTURE="/boot/grub/tard.jpg"
GRUB_GFXMODE="1024x768x32"
GRUB_GFXMODE="auto"
GRUB_DEFAULT="saved"
GRUB_SAVEDEFAULT="true"
GRUB_TIMEOUT_STYLE="menu"
GRUB_TIMEOUT="4"
GRUB_DISTRIBUTOR="`lsb_release -dcs|tail -n2|tr "\n" " " 2>/dev/null  || echo Debian; df|grep -wie " /"|cut -f1 -d" "`"
GRUB_DISABLE_OS_PROBER="false"
GRUB_HIDDEN_TIMEOUT="0"
GRUB_CMDLINE_LINUX="console"
GRUB_GFXPAYLOAD_LINUX="keep"
GRUB_COLOR_NORMAL="red/yellow"
GRUB_COLOR_HIGHLIGHT="green/red"
GRUB_TERMINAL_OUTPUT="gfxterm"
GRUB_CMDLINE_LINUX_DEFAULT="console"' > /tmp/grub.sh; 
####
####
$sudo mv /tmp/grub.sh /etc/default/grub; 
$sudo update-grub; 
printf %b "\n\n $\e[96m--\e[0m GRUB updated\n\n"; 
