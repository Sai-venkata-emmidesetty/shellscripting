#!/bin/bash

echo "Change the permissions of files in a directory."

# Prompting for directory name
read -p "Enter the directory name: " directory

# Checking if the entered name is a valid directory
echo "Checking if the entered name is a valid directory..."
if [ ! -d "$directory" ]; then
    echo "The entered directory is not valid."
    exit 1
fi

# Prompting for action details
read -p "Enter the action to perform (+/-) (add/remove): " perform
read -p "Enter the scope of action (u/g/o for users/groups/others): " persons
read -p "Enter the type of action to perform (r/w/x for read/write/execute): " actions

# Looping through files in the directory
for file in "$directory"/*; do
    if [ -e "$file" ]; then
        chmod "${persons}${perform}${actions}" "$file"
        echo "Permissions changed for $file"
    fi
done


