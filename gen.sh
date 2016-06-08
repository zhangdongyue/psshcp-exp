#!/bin/sh 

##
# author:dongyue.zdy
##

if [ $# -lt 1 ] 
then 
	echo "Usage: gen.sh <your_login_password>"
	exit
fi

pw=$1

sed -e "s|%%password%%|${pw}|g" scp.exp.tpl > scp.exp 
sed -e "s|%%password%%|${pw}|g" ssh.exp.tpl > ssh.exp

chmod +x scp.exp
chmod +x ssh.exp 

echo "....success...."
