#! /bin/sh

# Copyright (c) 2020 Arsene Temfack
#
# SPDX-License-Identifier: MIT

CONFIG_S=./conf.d

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

if [ -f $CONFIG_S/bashrc ]; then
	cp $CONFIG_S/bashrc ~/.bashrc
else
	echo "Missing file: $CONFIG_S/bashrc"
fi

if [ -f $CONFIG_S/bash_aliases ];then
	cp $CONFIG_S/bash_aliases ~/.bash_aliases
else
	echo "Missing file: $CONFIG_S/bash_aliases"
fi

if [ -f $CONFIG_S/bash_fancy ];then
	cp $CONFIG_S/bash_fancy ~/.bash_fancy
else
	echo "Missing file: $CONFIG_S/bash_fancy"
fi
