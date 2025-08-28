#!/usr/bin/env bash

dna1=$1
dna2=$2 
count=0 

# iter first string 
for (( i=0; i<${#dna1}; i++ )); do
  char="${dna1:$i:1}"
  char2="${dna2:$i:1}"
  # echo "$char"
  # echo "$char2"

  # if two chars do NOT match 
  # add 1 to count 
  if [ "$char" != "$char2" ]; then
    count=$(($count + 1))
  fi
  
done

echo "$count" 