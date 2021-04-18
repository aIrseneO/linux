#! /bin/sh

if [ "$#" -gt 1 ]; then
	echo "Too many arguments.\n	Usage: xorg.sh [dir]"
	exit
fi

if [ "$1" = "--help" ]; then
	echo "Usage: xorg.sh [dir]\n	--help	display this help and exit
The default directory is [../conf.d/] and the file looked up is xorg.conf"
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

if [ -f "$CONFIG_D/xorg.conf" ]; then
	sudo mkdir -p /etc/X11/xorg.conf.d
	sudo cp $CONFIG_D/xorg.conf /etc/X11/xorg.conf.d/my.xorg.conf
else
	echo "Missing file: $CONFIG_D/xorg.conf"
fi
