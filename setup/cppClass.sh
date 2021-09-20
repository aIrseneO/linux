#! /bin/bash

################################################################################
##     Copyright (c) 2021 Arsene Temfack                                      ##
##                                                                            ##
##     SPDX-License-Identifier: MIT                                           ##
################################################################################

COMMAND=makeclass
CONFIG_S=$(pwd)/conf.d/cppClass
CONFIG_D=$HOME/.cppClass

MSG1="Setup default files used by the command \`$COMMAND\` \
	  to create c++ classes.\n\n
\tUsage: $0 [--help | -h | help]\n\n
The source directory is : $CONFIG_S.\n
Files will be copied to : $CONFIG_D.\n"

MSG2="Source files are:\n
\t$CONFIG_S/class.sh\n
\t$CONFIG_S/mainMyclass.cpp\n
\t$CONFIG_S/makefileMyclass\n
\t$CONFIG_S/Myclass.cpp\n
\t$CONFIG_S/Myclass.hpp\n"

if [[ "$#" = "1" ]] &&
		[[ "$1" = "--help" || "$1" = "-h" || "$1" = "help" ]]; then
	echo -e $MSG1 "\n" $MSG2; exit 0
elif [ "$#" != 0 ]; then
	echo -e $MSG1 "\n" $MSG2; exit 1
fi
	
if [ ! -d $CONFIG_S ];then
	echo "Missing source directory: $CONFIG_S."; exit 1
fi

if [[ ! -f $CONFIG_S/class.sh || ! -f $CONFIG_S/mainMyclass.cpp ||
		! -f $CONFIG_S/makefileMyclass || ! -f $CONFIG_S/Myclass.cpp ||
		! -f $CONFIG_S/Myclass.hpp ]]; then
	echo -e "Missing source file(s).\n\n"$MSG2; exit 1
fi
	
if [ ! -d $CONFIG_D ]; then
	mkdir -p $CONFIG_D
fi

cp $CONFIG_S/class.sh $CONFIG_D/class.sh
cp $CONFIG_S/mainMyclass.cpp $CONFIG_D/mainMyclass.cpp
cp $CONFIG_S/makefileMyclass $CONFIG_D/makefileMyclass
cp $CONFIG_S/Myclass.cpp $CONFIG_D/Myclass.cpp
cp $CONFIG_S/Myclass.hpp $CONFIG_D/Myclass.hpp

if [[ ! -f $HOME/.bash_aliases ]]; then
	echo "alias $COMMAND='bash $CONFIG_D/class.sh'" > $HOME/.bash_aliases
	echo $0 Done!; exit $?
fi

if [[ `grep "alias $COMMAND='bash $CONFIG_D/class.sh'" $HOME/.bash_aliases | wc -l` = "1" ]]; then
	echo $0 Done!; exit $?
fi

if [[ `grep "alias $COMMAND=" $HOME/.bash_aliases|wc -l` = "1" ]]; then
	echo -e "Warning: Alias \`$COMMAND\` already in used.
\tCommand \`$COMMAND\` not set, check file: $HOME/.bash_aliases"; exit 1
fi

echo "alias $COMMAND='bash $CONFIG_D/class.sh'" >> $HOME/.bash_aliases
echo $0 Done!; exit $?
