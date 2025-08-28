#!/usr/bin/env bash

# The following comments should help you get started:
#   # call main with all of the positional arguments
#   main "$@"

# loop to check if every letter is in there 

#!/bin/bash

hello_input=$@

# Function to check if every letter of the alphabet is in the input
contains_all_letters() {
    input=$(echo "$hello_input" | tr '[:upper:]' '[:lower:]' | tr -cd 'a-z')
    for letter in {a..z}; do
        if [[ $input != *$letter* ]]; then
            echo "false"
            return 0
        fi
    done
    echo "true"
    return 0
}

# Main script
# read -p "Enter a string: " input_string
contains_all_letters
# contains_all_letters "$input_string"
