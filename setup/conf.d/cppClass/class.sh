#! /bin/sh

################################################################################
##     Copyright (c) 2020 Arsene Temfack                                      ##
##                                                                            ##
##     SPDX-License-Identifier: MIT                                           ##
################################################################################

######################## Functions #########################
make_mainfile() {
	sed "s|Myclass|$1|g" $2 >> main$1.cpp || \
		echo "Missing skeleton mainMyclass.c"

}

make_makefile() {
	sed "s|Myclass|$1|g" $2 >> makefile$1 || \
		echo "Missing skeleton makefileMyclass"
}

make_class_cpp() {
	sed "s|Myclass|$1|g" $2 >> $1.cpp || \
		echo "Missing skeleton Myclass.cpp"
}

make_class_hpp() {
	local ClassNameCap=$1
	sed "s|Myclass|$1|g" $2 >> $1.hpp || \
		echo "Missing skeleton Myclass.hpp"
	sed -i "s|MYCLASS|${ClassNameCap^^}|g" $1.hpp
}
######################## Main ##############################
if [ "$#" != 2 ]; then
	echo "Usage: $0 Skeletons_Directory ClassName"; exit 1
fi
#
if [ ! -d $1 ]; then
	echo "$1 is not a directory"; exit 1
fi
#
make_mainfile $2 $1/mainMyclass.cpp
make_makefile $2 $1/makefileMyclass
make_class_cpp $2 $1/Myclass.cpp
make_class_hpp $2 $1/Myclass.hpp
