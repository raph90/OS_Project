#!/bin/bash

echo $($1 $2 | head -n 1 | tr , " " | wc -w)
