#!/bin/bash

# Creates WORDS array and echos through all items in array
WORDS=(cat dog horse)
echo "${WORDS[@]}"

for WORD in "${WORDS[@]}";
do
  echo ${WORD}
done
