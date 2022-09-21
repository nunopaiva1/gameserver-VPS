#!/bin/bash

DIR="/pro"

#The next 3 lines replace the ssh config file. A new one is added that enables the SSH on a VPS.
#Finally, we enable this service and restart it to ensure it will be turned on by default.

rm /etc/ssh/sshd_config -r
cp sshd_config /etc/ssh ;

systemctl enable ssh && systemctl restart ssh &> /dev/null

echo ""
echo "SSH has been successfully activated."
echo ""

echo ""
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "Hello, please enter all the required information to start the transfer."
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo ""

echo "Gameserver's FTP hostname: "
read HOST
echo ""

echo "Gameserver's FTP user: "
read USER
echo ""

echo "Gameserver's FTP password: "
read PASSWORD
echo ""

echo "What should be the name of the new Minecraft service: "
read SERVICENAME

echo ""
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "Your server is now being transfered, please wait a few minutes."
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo ""

if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  cd /pro
else
  ###  Control will jump here if $DIR does NOT exists ###
  cd / && mkdir pro && cd /pro
fi

mkdir $SERVICENAME && cd $SERVICENAME ;

wget -r --user="${USER}" --password="${PASSWORD}" ftp://$HOST &> /dev/null && mv $HOST/* /pro/$SERVICENAME/ ;

if [ $? -eq 0 ]; then
	echo -e "The server has been successfully imported."
	echo ""

	rm -r $HOST
else
	echo -e "There was an error with the credentials entered. Please restart and make sure you enter the correct details."
	echo ""

	cd .. && rm -r $SERVICENAME
fi

