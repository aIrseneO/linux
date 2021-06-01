#! /bin/bash

# Copyright (c) 2020 Arsene Temfack
#
# SPDX-License-Identifier: MIT

#NAME=firstname.lastname
#FIRST=${NAME:0:3}
#LAST=${NAME#*.}
#echo "First name is $FIRST"
#echo "Last name is $LAST"

#echo "Enter a string"
#read A
#if [ ${#A} -eq 0 ]; then
#	echo "String entered is empty"
#fi

#read -p "Do you want to loop (yes/no): " RESPONSE
#case "$RESPONSE" in
#	"yes" | "y" | "YES" | "Y" )	echo "Then loop it's"
#								sh $0;;
#
#	"no" | "n" | "NO" | "N" )	echo "No loop then";;
#
#	* )							echo "what do you mean ?";;
#esac

weeks1() {
	i=0;
	while [ $i -le 4 ]; do
		echo "  Week $i"; sleep 1; i=$(($i+1))
	done
}

weeks2() {
	i=0;
	until [ $i -eq 5 ]; do
		echo "  Week $i"; sleep 1; i=$(($i+1))
	done
}
TEMP=$(mktemp /tmp/tempfile.XXXXXXXX)
TEMPDIR=$(mktemp -d /tmp/tempdir.XXXXXXXX)
for i in 1 2 3 4 5 6 7 8 9 10 11 12; do
	case "$i" in
		"1" )	echo "January"; weeks1;;
		"2" )	echo "Febuary"; weeks2;;
		"3" )	echo "March"; weeks1;;
		"4" )	echo "April"; weeks2;;
		"5" )	echo "May"; weeks1;;
		"6" )	echo "June"; weeks2;;
		"7" )	echo "July"; weeks1;;
		"8" )	echo "August"; weeks2;;
		"9" )	echo "September"; weeks1;;
		"10" )	echo "Octorber"; weeks2;;
		"11" )	echo "November"; weeks1;;
		"12" )	echo "December"; weeks2;;
		* )		echo "Out of range"; sleep 1;;
	esac
done
