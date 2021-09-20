#! /bin/bash

################################################################################
##     Copyright (c) 2021 Arsene Temfack                                      ##
##                                                                            ##
##     SPDX-License-Identifier: MIT                                           ##
################################################################################

MSG="Call executables:\n
\tbash.sh\n
\tterminator.sh\n
\tvim.sh\n
\tcppClass.sh\n
to setup default configuration files\n\n
\tUsage: $0 [--help | -h | help ]"

if [[ "$#" = "1" ]] &&
		[[ "$1" = "--help" || "$1" = "-h" || "$1" = "help" ]]; then
	echo -e $MSG; exit $?
fi

if [[ "$#" != "0" ]]; then
	echo -e $MSG; exit 1
fi

./bash.sh
./terminator.sh
./vim.sh
./cppClass.sh
#./xorg.sh $CONFIG_S
