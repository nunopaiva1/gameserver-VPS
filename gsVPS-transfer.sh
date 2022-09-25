#!/bin/bash

DIR="/pro"

echo ""
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "Hello, please enter all the required information to start the transfer."
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo ""

echo "Gameserver's FTP hostname: "
read HOST < /dev/tty
echo ""

echo "Gameserver's FTP user: "
read USER < /dev/tty
echo ""

echo "Gameserver's FTP password: "
read PASSWORD < /dev/tty
echo ""

echo "What should be the name of the new Minecraft service: "
read SERVICENAME < /dev/tty

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

if [ -d "$SERVICENAME" ]; then
   ### Take action if #SERVICENAME exists ###
   cd $SERVICENAME
else
   ### Creates new directory with the name of #SERVICENAME
   mkdir $SERVICENAME && cd $SERVICENAME ; 
fi

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

