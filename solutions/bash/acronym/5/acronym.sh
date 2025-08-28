#!/usr/bin/env bash

# take input 
# split by spaces and - 
# get the first letter of every word 

# prompt the user for input
# read input

# set IFS to split by both space and hyphen
# store both in array "array"
IFS=' -_*' read -r -a array <<< "$@"

# echo "$input" 

# for element in "${array[@]}"; do
#     echo "$element"
# done

# get the first litter of every word
initials=""
for element in "${array[@]}"; do
    first_letter="${element:0:1}"

    # capitalize it
    initials+=$(echo "$first_letter" | tr '[:lower:]' '[:upper:]')
done

# return  result
echo "$initials"