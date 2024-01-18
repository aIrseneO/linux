#! /bin/bash

################################################################################
##     Copyright (c) 2020 Arsene Temfack                                      ##
##                                                                            ##
##     SPDX-License-Identifier: MIT                                           ##
################################################################################

CONFIG_S=$(pwd)/conf.d
CONFIG_D=$HOME

MSG="Setup Bash personalized configuration files:\n
\t$CONFIG_D/.bash_fancy\n
\t$CONFIG_D/.bash_aliases\n
 Copied from \`$CONFIG_S\`\n\n
\tUsage: $0 [ --help | -h | help ]\n\n
\n
Note: This script will overwrite existing config files."

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

if [[ ! -f $CONFIG_S/bash_aliases || ! -f $CONFIG_S/bash_fancy || ! -f $CONFIG_S/git-prompt ]]; then
	echo "Missing configuration file(s)."; exit 1
fi

BASHRC=$CONFIG_D/.bashrc

BASHRC_FANCY="\n# Fancy bash\n
if [ -f ~/.bash_fancy ]; then\n
\t. ~/.bash_fancy\n
fi"

BASHRC_ALIASES="\n# Alias definitions\n
if [ -f ~/.bash_aliases ]; then\n
\t. ~/.bash_aliases\n
fi"

if [[ ! -f $BASHRC ]]; then
	echo -e $BASHRC_FANCY > $BASHRC
	echo -e $BASHRC_ALIASES >> $BASHRC
else
	if [[ `grep ". ~/.bash_fancy$" $BASHRC | wc -l` == "0" ]]; then
		echo -e $BASHRC_FANCY >> $BASHRC
	fi
	if [[ `grep ". ~/.bash_aliases$" $BASHRC | wc -l` == "0" ]]; then
		echo -e $BASHRC_FANCY >> $BASHRC
	fi
fi

cp $CONFIG_S/bash_aliases $CONFIG_D/.bash_aliases
cp $CONFIG_S/bash_fancy $CONFIG_D/.bash_fancy
cp $CONFIG_S/git-prompt $CONFIG_D/.git-prompt


echo $0 Done!; exit $?
