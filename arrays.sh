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

# Declare array and populate with all Admin emails
declare -a EMAIL_ARRAY
for item in $(echo ${EMAIL_JSON} | jq ".tenant_admins[].email");
do
  EMAIL_ARRAY+=("${item}")
done

# Find Readonly email addresses with Admin privileges and remove them
while read -r EMAIL; do
  if [[ " ${EMAIL_ARRAY[*]} " =~ ${EMAIL} ]]; then
    echo "${EMAIL} exists!"
  fi
done<"${EMAILS}"
