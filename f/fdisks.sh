#!/usr/bin/env bash
fdisks() {
sudo fdisk -lo Device,Size,Type,Attrs,Name|grep -v "loop"|grep -e "dev"|sed -e "s/Disk/\n&/g" -e "s/..[0-9]*\ bytes.*//g"|bat -ppfljava; echo; }; 
