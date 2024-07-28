#!bash

sed -i "s/?/$(cat $1 | tr '\n' 'R' | tr '"' "'")/g" $1
