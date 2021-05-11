#! /bin/sh

CONFIG_S=./conf.d/cppClass
CONFIG_D=~/.cppClass

if [ "$#" -gt 1 ] || [ "$1" = "--help" ]; then
	echo "Usage: $0 [dir]\n	--help  display this help and exit
The default directory is [$CONFIG_S]"; exit 1
fi

if [ "$#" = 1 ]; then
	CONFIG_S=$1
fi

if [ ! -d $CONFIG_S ]; then
	echo "Missing directory: $CONFIG_S\n	Use opion --help for help"; exit 1
fi

if [ ! -d $CONFIG_D ]; then
	mkdir ~/.cppClass
fi
cp -r $CONFIG_S/* $CONFIG_D
