#!/bin/bash
######## webmin
hash sudo 2>/dev/null && [ -z $SUDO_USER ] && sudo="sudo"; mkdir $HOME/tmp 2>/dev/null; 
########
echo -e "   ####################### "; 
echo -e "   ## WEBMINSTALLER ###### "; 
echo -e "   ####################### \n\n"; 
########
curl -o $HOME/tmp/webmin-setup-repo.sh "https://raw.githubusercontent.com/webmin/webmin/master/webmin-setup-repo.sh"; 
$sudo sh $HOME/tmp/webmin-setup-repo.sh; 
$sudo apt update; $sudo apt upgrade -y; 
$sudo apt install -y webmin --install-recommends; 
########
##
# cd $ghh; curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/# master/setup-repos.sh; chmod +x setup-repos.sh; sh setup-repos.sh;
# apt update; apt -y install webmin --install-recommends;
# cp $ghh/0000/conf/webmin.css 
# cd $ghh/0000; echo "$re$c2 Webmin installed !  . . ."; tput sgr0;
# echo -e "\n\n\t $green##$re"
# echo -e "\t $green#######################$re"
# echo -e "\t $green##$re WEBMIN - DONE$green ######$re"
# echo -e "\t $green#######################$re"
# echo -e "\n\n\t $green##$re \n\n"
##
# cd /tmp; 
# wget -OO.tar.gz https://download.webmin.com/devel/tarballs/webmin-current.tar.gz; 
# tar -xf O.tar.gz --strip-components=1;
# # cp $ghh/0000/conf/webminsetup.sh ./setup.sh -b;
# ./setup.sh /usr/local/webmin 
# echo gg
##
##
