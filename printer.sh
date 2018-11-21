#!/bin/bash

# take in a line 

# echo "one two three four" | while read -a wordarray; do
#     echo ${wordarray[1]}
# done


echo $1 | while IFS=, read -a colarray; do
# takes in a line of words and splits them
    shift
    for arg in $@; do 
        spesharg="$arg"
        (( spesharg--))
        echo -n ${colarray[$spesharg]} 
        echo -n " "
    done
done