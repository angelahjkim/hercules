#!/bin/bash

if [ "$EUID" -ne 0 ]
	echo "Only root user can make changes"
	exit
fi

apt-get install openssh-server -y

if [ grep -q 'Port 22' /etc/ssh/sshd_config ]; then
	sed -i '/Port 22/d' /etc/ssh/sshd_config
	echo "Port 55555" >> /etc/ssh/sshd_config
fi

systemctl restart ssh
