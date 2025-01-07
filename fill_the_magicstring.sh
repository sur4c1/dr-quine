#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: $0 <file>"
	exit 1
fi

file=$1
str='"[^"]*"'
sed -i 's/i = 5/i = ~/' $file
banalised='"'$(sed "0,/$str/s/$str/\"?\"/g" $file\
	| tr '"' 'D'\
	| tr "'" 'Q'\
	| tr '\\' 'B'\
	| tr '\n' 'N'\
	| tr '\t' 'T'\
)'"'
sed -i 's/i = ~/i = 5/' $file

# replace first string by "?"
sed -i "0,\!$str!s!$str!$banalised!" $file
