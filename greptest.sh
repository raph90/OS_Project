#!/bin/bash


# line=$(head -n 1 company/employee.txt)

# echo "$line" | tr , " " | wc -w

# this will get the number of words in the first line


new="$1"

num=$(echo "$new" | tr , " " | wc -w)

echo "$num"