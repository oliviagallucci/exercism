#!/usr/bin/env bash

# The following comments should help you get started:
#   # call main with all of the positional arguments
#   main "$@"

# loop to check if every letter is in there 

#!/bin/bash

# Function to check if every letter of the alphabet is in the input
contains_all_letters() {
    input=$(echo "$@" | tr '[:upper:]' '[:lower:]' | tr -cd 'a-z')
    for letter in {a..z}; do
        if [[ $input != *$letter* ]]; then
            echo "False"
            return 1
        fi
    done
    echo "True"
    return 0
}

# Main script
# read -p "Enter a string: " input_string

# contains_all_letters "$input_string"
