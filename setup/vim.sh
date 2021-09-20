#! /bin/bash

################################################################################
##     Copyright (c) 2020 Arsene Temfack                                      ##
##                                                                            ##
##     SPDX-License-Identifier: MIT                                           ##
################################################################################

CONFIG_S=$(pwd)/conf.d
CONFIG_D=$HOME

MSG="Setup Vim personalized user configuration files.\n\n
\tUsage: $0 [ --help | -h | help ]\n\n
Copy files:\n
\t$CONFIG_S/vimrc\n
\t$CONFIG_S/vim_license.vim\n
to:\n
\t$CONFIG_D/.vimrc\n
\t$CONFIG_D/.vim/plugin"

if [[ "$#" = "1" ]] &&
		[[ "$1" = "--help" || "$1" = "-h" || "$1" = "help" ]]; then
	echo -e $MSG; exit 0
fi

if [[ "$#" != "0" ]]; then
	echo -e $MSG; exit 1
fi

if [ ! -d $CONFIG_S ]; then
	echo -e "Missing source directory:
		$CONFIG_S\n\tUse option --help for help"; exit 1
fi

if [[ ! -f $CONFIG_S/vimrc || ! -f $CONFIG_S/vim_license.vim ]]; then
	echo -e "Missing source file(s)\n\tUse option --help for help"; exit 1
fi

cp $CONFIG_S/vimrc $CONFIG_D/.vimrc
mkdir -p $CONFIG_D/.vim/plugin
cp $CONFIG_S/vim_license.vim  $CONFIG_D/.vim/plugin/

echo $0 Done!; exit $?
