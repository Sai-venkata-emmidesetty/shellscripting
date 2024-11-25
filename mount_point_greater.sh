#!/bin/bash

#if a particular mount is > than 70% zip the files modified older than 7days and move them to specified directory
read -p "enter the mount point to check: " mount_point
read -p "enter the directory to move: " directory_to_move
max_utilization=70


current_utilization=$(df -h | grep "$mount_point" | awk '{print $5}'| sed 's/%//g')

if [ "$current_utilization" -ge "$max_utilization" ]; then
    echo "max utilization is done"
    echo "moving the files older than 7days to $directory_to_move directory"
else
    echo "utilization is below the max_utilization"
    exit 1
fi

old_files=$(find "$mount_point" -type f -mtime +7) 

#$old_files is a list of files found by the find command. If there are multiple files, 
#it will be treated as a single string, which might not work correctly in zip. 
#You need to ensure that find correctly returns a list of files.

#Check if any files are found
if [ -z "$old_files"]; then
    echo "no files found"
    echo "since no files are found we are exiting the script"
    exit 1
fi

file_name=$(date +"%d%m%y_%h%m%s")

zip -r "$file_name".zip $old_files

if [ $? -eq 0 ]; then
    echo "zip successfull"
else
    echo "zip was not successfull,something went wrong"
fi

mv $file_name.zip $directory_to_move

if [ $? -eq 0 ]; then
    echo "move successfull to $directory_to_move directory"
    echo "removing the old files that are zipped"
    rm -rf $old_files
fi

#------------------------------------------------------------------
#s - substitute command
#% - the char you want to remove
#// - Replace % with nothing 
#g - Global flag,meaning "apply to all occurences in a line"

