#! /bin/bash

################################################################################
#     Copyright (c) 2021 Arsene Temfack                                        #
#                                                                              #
#     SPDX-License-Identifier: MIT                                             #
################################################################################
#
MSG="Update Vim and Bash configuration files:\n
- .vimrc\n
- .bashrc; .bash_fancy; .bash_aliases\n\n
Usage: $0 USER"
#
[[ "$#" != 1 ]] && \
	echo -e $MSG && exit 1
#
[[ "$1" = "--help"  || "$1" = "-h" ]] && \
	 echo -e $MSG && exit 0
#
USR=$1
#
git clone https://github.com/airseneo/linux.git _linux
[[ "$?" != 0 ]] && exit 1
bash _linux/setup/vim.sh _linux/setup/conf.d
[[ "$?" != 0 ]] && rm -rf _linux && exit 1
sudo -H -u $USR bash -c "bash _linux/setup/vim.sh _linux/setup/conf.d"
[[ "$?" != 0 ]] && rm -rf _linux && exit 1
bash _linux/setup/bash.sh _linux/setup/conf.d
[[ "$?" != 0 ]] && rm -rf _linux && exit 1
sudo -H -u $USR bash -c "bash _linux/setup/bash.sh _linux/setup/conf.d"
[[ "$?" != 0 ]] && rm -rf _linux && exit 1
rm -rf _linux
echo "Done!"
