#!/bin/bash

echo "$oldest file finder in a particular directory"
read -p "enter the directory name: " directory

oldest_file=$(find "$directory" -type f -printf "%T+ %p\n" | sort | head -n 1 | cut -d' ' -f2)

#space between ! and z should be important
if [ ! -z "$oldest_file" ]; then 
    echo "oldest file found"
    echo "oldest file is $oldest_file"
else
    echo "No file found=
    
fi



#----------------------------------------------------------------------------------------------

#find "$directory" -type f -printf "%T+ %p\n"-> space should be present between "%T+ %p\n"

#-type f: Finds files only (ignores directories).

#-printf "%T+ %p\n": Prints the modification time (%T+ gives the full timestamp, including the date and time) and the file path (%p).

#head -n 1: extracts only the first line, which corresponds to the oldest file based on its modification time.

#[ ! -z "$oldest_file" ]: Proper spacing around the ! -z condition, ensuring it checks if oldest_file is not empty.
#----------------------------------------------------------------------------------------------------
#example output of find:
#2024-11-20+14:32:02 /path/to/directory/oldfile.txt
#2024-11-22+09:00:15 /path/to/directory/newfile.txt
#-----------------------------------------------------------------------------------------------------
#The sort command is used to sort the output of find by timestamp (from the oldest to the newest file)
#------------------------------------------------------------------------------------------------------
#d'<delimiter>': Specifies the delimiter (separator) used to split the text into fields.
#-f<field_number>: Specifies which field (or column) you want to extract based on the delimiter.
#In this case, cut is used with a space (' ') as the delimiter and is instructed to extract the second field.
#-----------------------------------------------------------------------------------------------------------
#%P prints the relative file path with respect to the specified directory, but it may not be suitable for files within subdirectories or files with special characters.
#%p (lower_case)prints the full file path from the root of the filesystem, which is more reliable in this case.
#-------------------------------------------------------------------------------------------------------------
#Adding a newline (\n) ensures each file is printed on a new line, which helps when sorting the output.
#-----------------------------------------------------------------------------------------------------
