#!/bin/bash

read -p "mount using sshfs or nfs? " mntMethod

if [ $mntMethod == "sshfs" ]; then
	sshfs -o IdentityFile=$HOME/.ssh/id_rsa nuc8:/media/plexmediaserver $HOME/Media/plexmediaserver
elif [ $mntMethod == "nfs" ]; then
	sudo mount nuc8:/plexmediaserver $HOME/Media/plexmediaserver
else
	echo "Invalid input"
fi
