#!/bin/bash

while IFS= read -r line; do
    echo -e "First line in file is:\n$line"
    break
done < file.txt

#------------------------------------------------------------------------------------------------------
#  "IFS" = read -r: This ensures the script reads the input line by line, preserving leading/trailing whitespaces and avoiding backslash escapes.
# "line" : The variable used to store each line read from the file.
# "-e in echo" : Enables interpretation of escape characters like \n to create a newline.
# "break": Terminates the loop after processing the first line to avoid reading the entire file(remove if u want to read all lines)
# "< file.txt": Redirects the content of file.txt as input to the while loop.
#-------------------------------------------------------------------------------------------