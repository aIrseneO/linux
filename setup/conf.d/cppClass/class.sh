#! /bin/bash

################################################################################
##     Copyright (c) 2021 Arsene Temfack                                      ##
##                                                                            ##
##     SPDX-License-Identifier: MIT                                           ##
################################################################################

COMMAND=makeclass
CONFIG_D=$HOME/.cppClass

MSG="Create/Remove files for a C++ class.\n\n
\tUsage: $COMMAND [ --help | -h | help ] | [ [ -r | -c ] ClassName ]\n
\t  --help | -h | help: Display this help and exit.\n
\t  -r ClassName: \`make fclean\` and Remove Files for the class ClassName\n
\t  -c ClassName: Create Files for the class ClassName\n\n
For a given class \`foo\`, the Files are:\n
\tfoo.cpp\n
\tfoo.hpp\n
\tmainfoo.cpp\n
\tmakefilefoo\n\n
The Skeletons of these Files are in the directory $CONFIG_D/\n
under the names:\n
\tMyclass.cpp\n
\tMyclass.hpp\n
\tmainMyclass.cpp\n
\tmakefileMyclass."

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

check_source_files() {
	if [[ ! -f $CONFIG_D/class.sh || ! -f $CONFIG_D/mainMyclass.cpp ||
			! -f $CONFIG_D/makefileMyclass || ! -f $CONFIG_D/Myclass.cpp ||
			! -f $CONFIG_D/Myclass.hpp ]]; then
		return 1
	fi
	return 0
}

create_class() {
	if [[ -f $1.cpp || -f $1.hpp || -f makefile$1 || -f main$1.cpp ]]; then
		echo "Class File(s) already exist, check help"; return 1
	fi

	make_mainfile $1 $CONFIG_D/mainMyclass.cpp
	make_makefile $1 $CONFIG_D/makefileMyclass
	make_class_cpp $1 $CONFIG_D/Myclass.cpp
	make_class_hpp $1 $CONFIG_D/Myclass.hpp
}

remove_class() {
	if [[ -f makefile$1 ]]; then
		make --silent -f makefile$1 fclean 2> /dev/null
	fi

	rm $1.cpp 2> /dev/null
	rm $1.hpp 2> /dev/null
	rm main$1.cpp 2> /dev/null
	rm makefile$1 2> /dev/null
}

######################## Main ##############################

check_source_files
if [[ "$?" = "1" ]]; then
	echo "Missing Source Directory/File(s), check help"; exit 1
fi

if [[ "$#" = "1" ]] &&
		[[ "$1" = "--help" || "$1" = "-h" || "$1" = "help" ]]; then
	echo -e $MSG; exit 0
fi

if [[ "$#" = "2" ]]; then
	if [[ "$1" = "-c" ]]; then
		create_class $2; exit $?
	elif [[ "$1" = "-r" ]]; then
		remove_class $2; exit $?
	fi
fi

echo -e $MSG; exit 1
