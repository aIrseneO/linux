#! /bin/bash

################################################################################
##     Copyright (c) 2020 Arsene Temfack                                      ##
##                                                                            ##
##     SPDX-License-Identifier: MIT                                           ##
################################################################################

CONFIG_S=$(pwd)/conf.d
CONFIG_D=$HOME

MSG="Setup Bash personalized configuration files:\n
\t$CONFIG_D/.bashrc\n
\t$CONFIG_D/.bash_fancy\n
\t$CONFIG_D/.bash_aliases\n
Copied from $CONFIG_S\n\n
\tUsage: $0 [ --help | -h | help ]\n"

if [[ "$#" = "1" ]] &&
		[[ "$1" = "--help" || "$1" = "-h" || "$1" = "help" ]]; then
	echo -e $MSG; exit 0
fi

if [[ "$#" != "0" ]]; then
	echo -e $MSG; exit 1
fi


if [ ! -d $CONFIG_S ]; then
	echo "Missing directory: $CONFIG_S\n	Use opion --help for help"; exit 1
fi

if [[ ! -f $CONFIG_S/bashrc || ! -f $CONFIG_S/bash_aliases ||
		! -f $CONFIG_S/bash_fancy ]]; then
	echo "Missing configuration file(s)."; exit 1
fi

cp $CONFIG_S/bashrc $CONFIG_D/.bashrc
cp $CONFIG_S/bash_aliases $CONFIG_D/.bash_aliases
cp $CONFIG_S/bash_fancy $CONFIG_D/.bash_fancy

echo $0 Done!; exit $?
