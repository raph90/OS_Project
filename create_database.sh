#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "This script needs a parameter to run"
    exit 1
elif [ -d "$1" ]; then
    echo "A database by that name already exists"
    exit 1
else 
    mkdir $1 
fi