#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Error: You have passed an incorrect number of parameters"
elif [ ! -d "$1" ]; then
    echo "Error: DB doesn't exist!"
    exit 1
elif [ ! -f "$1/$2.txt" ]; then
    echo "Error: table does not exist"
    exit 1
else
    words=$(echo "$3" | tr , " ")
    prevword=0
    for word in $words; do
        currentword="$word"
        if [ "$word" -lt 1 ] || [ "$word" -gt $(./colcheck.sh cat "$1/$2.txt") ]; then
            echo "Column "$word" does not exist"
            exit 1
        elif [ "$prevword" -gt "$currentword" ]; then
            echo "Please enter columns from first to last"
            exit 1   
        fi
        prevword=$currentword
    done || exit 1
fi

# echo "start_result"
# {
#     read 
#     while read line; do
#         ./printer.sh $line $words
#         echo " "
#     done 
# } < "$1/$2.txt"
# echo "end_result"

file="$1/$2.txt"

echo "start_result"
while read line; do
    ./printer.sh $line $words
    echo " "
done < <(tail -n +2 $file)
echo "end_result"

 


