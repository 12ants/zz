
apto() { 
## maybe IFS 
local IFS=$'\n'; 
# aptoin=($(apt list --installed|grep -vE "lib.*"|cut -f1 -d"/"));

# aptoinver=($(apt show ${aptoin[*]} 2>/dev/null|grep -IE "Package: |Installed-Size: |Description: "|sed -e "s/Package\:\ /----\np:\ /g"|cut -f2- -d" "|tr -s "\n" " "|sed -e "s/----\ /\n/g" -e "s/\ [0-9]/\\x1b[2m&/g" -e 's/\ MB\ /\x1b[0;36mMB\x1b[0m /g' -e "s/\ kB\ /\x1b[0;34mkB\x1b[0m /g"  -e 's/\ B\ /\x1b[0;33mB\x1b[0m /g')); 

aptowhen=($($sudo cat $PREFIX/var/log/apt/history.log | grep -E "install |remove " -B1|sed -e "/[()]/d" -e "s/\ \-y//g" -e "s/apt\ //g" -e "s/.*\:\ //"|sed -e "s/install/\x1b[92m&\x1b[0m/g" -e "s/remove/\x1b[91m&\ \x1b[0m/g" | tr -s "\n" " "|sed -e "s/--\ /\n/g" -e "s/[-]/\x1b[2m&\x1b[0m/g" -e "s/[:]/\x1b[35m&\x1b[0m/g")); 

# apto=($(apt show ${aptoin[*]} 2>/dev/null|grep -IE "Package: |Installed-Size: |Description: "|sed -e "s/Package\:\ /----\np:\ /g"|cut -f2- -d" "|tr -s "\n" " "|sed -e "s/----\ /\n/g" -e "s/\ [0-9]/\\x1b[2m&/g" -e 's/\ MB\ /\x1b[0;36mMB\x1b[0m /g' -e "s/\ kB\ /\x1b[0;34mkB\x1b[0m /g"  -e 's/\ B\ /\x1b[0;33mB\x1b[0m /g'))

# \n${apto[*]}
# \n${aptoin[*]}
# \n${aptoinver[*]}
printf %b "\n
\n${aptowhen[*]}

"; 
IFS=$' \n\t';
}; 

