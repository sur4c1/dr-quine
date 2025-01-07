#!/bin/bash

make --silent re

OK="[\033[0;32mOK\033[0m]"
KO="[\033[0;31mKO\033[0m]"

printf "Colleen: "
if cmp -s <(./Colleen) Colleen.c; then
	printf "$OK"
else
	printf "$KO"
fi
printf "\n"

printf "Grace:   "
./Grace 2> /dev/null
if cmp -s Grace_kid.c Grace.c; then
	printf "$OK"
else
	printf "$KO"
fi
printf "\n"

mkdir -p sully_test
cp cp Sully sully_test 2> /dev/null
cd sully_test
./Sully 2> /dev/null
# check is there is 13 files with the name containing Sully
printf "Sully:   "
if [ $(ls -1 | grep Sully | wc -l) -eq 13 ]; then
	printf "$OK"
else
	printf "$KO"
fi
# check if all the .c files are the same with only the line 'int i = 5;' that changes
for i in {0..5}; do
	sed "s/int i = 5;/int i = ~;/" Sully_$i.c > Sully_$i.c.tmp
	if ! cmp -s Sully_$i.c.tmp Sully_$i.c; then
		printf "$KO"
		break
	else
		printf "$OK"
	fi
done
cd ..
rm -rf sully_test
printf "\n"
