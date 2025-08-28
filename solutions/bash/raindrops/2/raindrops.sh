#!/usr/bin/env bash

# - is divisible by 3, add "Pling" to the result.
# - is divisible by 5, add "Plang" to the result.
# - is divisible by 7, add "Plong" to the result.
# - is NOT divisible by 3, 5, or 7, the result should be the number as a string.

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

# Assign the first argument to the num variable
num=$1
str=""

if [ $(($num % 3)) -eq 0 ]; then
    str+="Pling"
fi 

if [ $(($num % 5)) -eq 0 ]; then
    str+="Plang"
fi

if [ $(($num % 7)) -eq 0 ]; then
    str+="Plong"
fi 

if [[ $(($num % 3)) -ne 0 && $(($num % 7)) -ne 0 && $(($num % 5)) -ne 0 ]]; then
    echo "$num"
else
    echo "$str"
fi
