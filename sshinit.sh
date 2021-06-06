#!/bin/bash

################################################################################
##     Copyright (c) 2020 Arsene Temfack                                      ##
##                                                                            ##
##     SPDX-License-Identifier: MIT                                           ##
################################################################################

# Check if the user is the root of the system 
if [[ $whoami -ne "root" ]]
then
	echo "You need to be the root to run this script"
	exit 1
fi

# Update the apt package repository on the system
apt-get update

# Install OpenSSH, -y flag answer yes to all questions 
apt-get install openssh-server -y

# Check whether OpenSSH is running, start it if not  
X="systemctl status ssh | grep 'Active: active (running)' | wc -l"
# Or: X="/etc/init.d/ssh status | grep 'Active: active (running)' | wc -l"

if [[ $(eval "$X") -eq 0 ]]
then
	systemctl start ssh # Or: /etc/init.d/ssh start
fi

# Before changing the ssh port let's create a backup file if there isn't any
Y="ls /etc/ssh/sshd_config_backup | wc -l"
if [[ $(eval "$Y") -eq 0 ]]
then
	cp /etc/ssh/sshd_config /etc/ssh/sshd_config_backup
fi

# New port number, it has to be between 1024 and 65535
NEW_PORT=4242

# Check if the port value haven been change already, if so exit
Z="cat /etc/ssh/sshd_config | grep 'Port $NEW_PORT' | wc -l"
if [[ $(eval "$Z") -eq 1 ]]
then
	echo "Port have already been changed to $NEW_PORT"
	exit 1
fi 

# Using the sev app, let's substitute globaly the port number
sed -i "s/#Port .*/#Port $NEW_PORT/g" /etc/ssh/sshd_config 

# Allert the user for the change of the ssh port
echo "The new ssh port is $NEW_PORT"

# Restart the OpenSSH
systemctl restart ssh # Or: /etc/init.d/ssh restart

# Resource: linuxhint.com/enable-ssh-server-debian/
# This script is made to be run on debian 10.3 newly installed. 
