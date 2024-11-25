#!/bin/bash

echo "shell script that recursively searches for all .c files in the specified directory & its subdirectories"
directory="temp/reg"

echo "Searching for .c files in $directory..."

find "$directory" -type f -name "*.c"


# find "$directory": Starts searching in the specified directory and its subdirectories.
# -type f: Ensures only files are included in the results.
# -name "*.c": Matches files with the .c extension.
# The find command in Unix/Linux is recursive by default,--->
# meaning it will traverse through the given directory and all its subdirectories unless explicitly told not to.


