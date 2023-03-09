#!/bin/bash

str_replace() {
    while read line; do
       echo ${line//'string'/'new string'};
    done < $1 > /tmp/$1
    mv /tmp/$1 $1
}

#cd /home/debian/workspace
for entry in *
do
    if [ $entry != "str_replace.sh" ]; then
        #str_replace $entry
        echo ${entry%.*} # file without extension.
    fi
done
