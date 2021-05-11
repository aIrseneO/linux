#! /bin/sh

CONFIG_S=./conf.d
CONFIG_D=/etc/X11/xorg.conf.d

if [ "$#" -gt 1 ] || [ "$1" = "--help" ]; then
	echo "Usage: $0 [dir]\n --help  display this help and exit
The default directory is [$CONFIG_S]"; exit 1
fi

if [ "$#" = 1 ]; then
	CONFIG_S=$1
fi

if [ ! -d $CONFIG_S ]; then
	echo "Missing directory: $CONFIG_S\n    Use opion --help for help"; exit 1
fi

if [ -f "$CONFIG_S/xorg.conf" ]; then
	sudo mkdir -p $CONFIG_D; sudo cp $CONFIG_S/xorg.conf $CONFIG_D/my.xorg.conf
else
	echo "Missing file: $CONFIG_S/xorg.conf"
fi
