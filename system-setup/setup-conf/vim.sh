#! /bin/sh

CONFIG_S=./conf.d

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

if [ -f $CONFIG_S/vimrc ]; then
	cp $CONFIG_S/vimrc ~/.vimrc
else
	echo "Missing file: $CONFIG_S/vimrc"
fi
