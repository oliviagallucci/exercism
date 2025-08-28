#!/usr/bin/env bash


# The goal of this exercise is to consider the number of arguments passed to your program. If there is exactly one argument, print a greeting message. Otherwise print an error message and exit with a non-zero status.

if [ "$#" -eq 1 ]; then
    echo "Hello, $1"
else
    echo "Usage: error_handling.sh <person>"
    exit 1
fi
