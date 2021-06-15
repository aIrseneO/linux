#! /bin/bash

TOP_OLD_LICENSE=1
BOT_OLD_LICENCE=12

EXTENSION1=.c
EXTENSION1_LEN=2
LICENSE1=MIT1

EXTENSION2=.h
EXTENSION2_LEN=2
LICENSE2=MIT1

FILE1=Makefile
FILE1_LEN=8
LICENSE3=MIT21

#FILE2=
#LICENSE4=

sed -i "$TOP_OLD_LICENSE,$BOT_OLD_LICENCE d" $1/*$EXTENSION1 
sed -i "$TOP_OLD_LICENSE,$BOT_OLD_LICENCE d" $1/*$EXTENSION2
sed -i "$TOP_OLD_LICENSE,$BOT_OLD_LICENCE d" $1/$FILE1

for file in $1/*; do
	if [[ ${file:(-$EXTENSION1_LEN)} == "$EXTENSION1" ]]; then
		vim -c ":$LICENSE1" -c ":wq" $file
	elif [[ ${file:(-$EXTENSION2_LEN)} == "$EXTENSION2" ]]; then
		vim -c ":$LICENSE2" -c ":wq" $file
	elif [[ "/${file:(-$FILE1_LEN)}" == "/$FILE1" ]]; then
		vim -c ":$LICENSE3" -c ":wq" $file
	fi
done
