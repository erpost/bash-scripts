#!/bin/bash

# Creates WORDS array and echos through all items in array
WORDS=(cat dog horse)
echo "${WORDS[@]}"

for WORD in "${WORDS[@]}";
do
  echo ${WORD}
done


ANIMAL="dog"

# Checks if ANIMAL is in (list)
if [[ "$ANIMAL" =~ ^(cat|bird|horse)$ ]]; then
    echo "$ANIMAL is in the list"
else
    echo "$ANIMAL is not in the list"
fi

# Checks if ANIMAL is in scratch.txt
if [[ "$ANIMAL" =~ $(echo ^\("$(paste -sd'|' ./scratch.txt)"\)$) ]]; then
    echo "$ANIMAL is in the list"
else
    echo "$ANIMAL is not in the list"
fi
