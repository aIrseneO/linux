#!/bin/bash
MSG="Reset/Update the variable \`__ID__\` in Vagrantfile.\n\n
Usage: $0 [ reset | ID | help]"

if [[ "$#" == "1" ]]; then 
	if [[ "$1" == "reset" ]]; then
		sed -i "s:ID = .*:ID = \"__ID__\":g" Vagrantfile
		exit $?
	elif [[ "$1" == "help" ]]; then
		echo -e $MSG ; exit $?
	fi
	sed -i "s:__ID__:$1:g" Vagrantfile
	exit $?
fi
echo -e $MSG; exit 1;
