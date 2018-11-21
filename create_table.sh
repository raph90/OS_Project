#!/bin/bash


if [ "$#" -lt 3 ]; then
    echo "Not enough parameters"
    exit 1
elif [ "$#" -gt 3 ]; then
    echo "Too many parameters"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "That directory doesn't exist!"
    exit 1
elif [ -f "$1/$2.txt" ]; then
    echo "That table already exists!"
    exit 1
else 
    touch "$1/$2.txt"
fi

echo "$3" > "$1/$2.txt"
echo "Ok, table created"
exit 0


#     echo "That table already exists!"
#     exit 1