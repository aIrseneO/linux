#! /bin/sh

if [ "$#" -gt 1 ]; then
	echo "Too many arguments.\n	Usage: terminator.sh [dir]"
	exit
fi

if [ "$1" = "--help" ]; then
	echo "Usage: terminator.sh [dir]\n	--help	display this help and exit
The default directory is [../conf.d/]"
	exit
fi

if [ "$#" = 1 ]; then
	CONFIG_D=$1
else
	CONFIG_D=../conf.d
fi

if [ ! -d $CONFIG_D ]; then
	echo "Missing directory: $CONFIG_D\n	Use opion --help for help"
	exit
fi

if [ -f "$CONFIG_D/terminator.conf" ]; then
	cp $CONFIG_D/terminator.conf ~/.config/terminator/config
else
	echo "Missing file: $CONFIG_D/terminator.conf"
fi
