#!/bin/bash

echo "$zip the files from a given directory to s3"

read -p "enter the directory path: " directory_path
read -p "enter the s3 bucket path: " s3_link

if [ !-d "$directory_path" ]; then
    echo "entered path is not a directory"
    exit 1
fi

if [ $? -eq 0 ]; then
    echo "entered path directory exists"
fi

log_file=$(date +"%d%m%y_%m%h%s")

zip_file=logs_$log_file.zip

zip -r "$zip_file" "$directory_path/*.log"

if[ $? -ne 0 ]; then 
    echo "zip unsuccessful"
    exit 1
fi

aws s3 cp "$zip_file" "$s3_link"

if[ $? -eq 0 ]; then
    echo "upload successfullyyy!!"
fi

echo "removing the log files from system"

rm -f "$zip_file"

echo "zip_files_removed_successfully"

