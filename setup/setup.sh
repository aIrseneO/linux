#! /bin/sh

################################################################################
##     Copyright (c) 2020 Arsene Temfack                                      ##
##                                                                            ##
##     SPDX-License-Identifier: MIT                                           ##
################################################################################

CONFIG_S=$(pwd)/conf.d

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

./bash.sh $CONFIG_S
./terminator.sh $CONFIG_S
./vim.sh $CONFIG_S
./cppClass.sh $CONFIG_S
#./xorg.sh $CONFIG_S
