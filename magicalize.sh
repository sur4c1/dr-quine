#!bash

sed -i "s|?|$(cat $1 | tr '\n' 'N' | tr '"' "'")|g" $1
