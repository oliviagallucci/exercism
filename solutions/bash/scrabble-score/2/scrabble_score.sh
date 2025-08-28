#!/usr/bin/env bash

#
#   # call main with all of the positional arguments
#   main "$@"

counter=0 
input_string=$@

for (( i=0; i<${#input_string}; i++ )); do
    char=${input_string:$i:1}
    # A, E, I, O, U, L, N, R, S, T	1
    if [[ $char =~ [AEIOULNRSTaeioulnrst] ]]; then
        ((counter++))
    fi

    # D, G	2
    if [[ $char =~ [DGdg] ]]; then
        ((counter+=2))
    fi

    # B, C, M, P	3
    if [[ $char =~ [BCMPbcmp] ]]; then
        ((counter+=3))
    fi

    # F, H, V, W, Y	4
    if [[ $char =~ [FHVWYfhvwy] ]]; then
        ((counter+=4))
    fi

    # K	5
    if [[ $char =~ [Kk] ]]; then
        ((counter+=5))
    fi

    # J, X	8
    if [[ $char =~ [JXjx] ]]; then
        ((counter+=8))
    fi

    # Q, Z	10
    if [[ $char =~ [QZqz] ]]; then
        ((counter+=10))
    fi
done

echo "$counter"
