#! /bin/bash

################################################################################
##     Copyright (c) 2020 Arsene Temfack                                      ##
##                                                                            ##
##     SPDX-License-Identifier: MIT                                           ##
################################################################################

CONFIG_S=$(pwd)/conf.d/terminator.conf
CONFIG_D=$HOME/.config/terminator

MSG="Setup Terminator personalized configuration file\n\n
\tUsage: $0 [ --help | -h | help ]\n\n
Copy source file: $CONFIG_S\n
to: $CONFIG_D/config"

if [[ "$#" = "1" ]] &&
		[[ "$1" = "--help" || "$1" = "-h" || "$1" = "help" ]]; then
	echo -e $MSG; exit 0
fi

if [[ "$#" != "0" ]]; then
	echo -e $MSG; exit 1
fi

if [ ! -f $CONFIG_S ]; then
	echo "Missing source file: $CONFIG_S\n    Use opion --help for help"; exit 1
fi

mkdir -p $CONFIG_D; 
cp $CONFIG_S $CONFIG_D/config

echo $0 Done!; exit $?
