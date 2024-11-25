#!/bin/bash

# $1 and $2 are command line arguements

file1="$1.txt"
file2="$2.txt"

if [[ !-f "$file1" || !-f "$file2" ]]; then
    echo "one or both files do not exist"
    exit 1
fi

while IFS=read -r line; do
     count=$(grep -o -w "$line" "$file2" | wc -l)
     echo "The term $lines repeated $count times in $file2 "
done < $file1

#-----------------------------------------------------------------------------------

#example input- ./script.sh file1 file2

#-----------------------------------------------------------------------------------

#grep -o -w "$line" "$file2":
#    Searches for the term in file2.txt.
#   -o: Outputs each match on a new line.
#   -w: Ensures only whole words are matched (e.g., cat won't match catalog).
#   $line: The current term from file1.txt being searched for.
#   wc -l: Counts the number of lines output by grep, effectively counting occurrences of the term.
#---------------------------------------------------------------------------------------------------

#grep "$line" "$file2"
  #Basic Functionality:grep searches for lines in file2 that contain the pattern specified by $line.
  #By default, it outputs the entire line(s) that match.
#Key Considerations:
 #Partial Matches:
    #grep without -w will match partial words. For example:#If $line is cat, it will match both cat and catalog.
    #Multiple Matches on a Line:
     #If a line contains the term more than once, it will still be output as a single line( if you are not using -o)
#Case Sensitivity:
     #By default, grep is case-sensitive. For example, if $line is Cat, it won’t match cat
#-------------------------------------------------------------------------------------------------------------