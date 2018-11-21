#!/bin/bash

if [ ! -d "$1" ]; then
    echo "Error: DB doesn't exist!"
    exit 1
elif [ ! -f "$1/$2.txt" ]; then
    echo "Error: table does not exist"
    exit 1
else

    

    num=$(./colcheck.sh echo "$3")
    other=$(./colcheck.sh cat "$1/$2.txt")
    
    if [[ $(./colcheck.sh echo "$3") -ne $(./colcheck.sh cat "$1/$2.txt") ]]; then
        echo "Error: number of columns in tuple does not match schema"
    else
        echo "$3" >> "$1/$2.txt"
        echo "OK: tuple inserted"
        exit 0
    fi
fi






