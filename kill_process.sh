#!/bin/bash

echo "$program to kill a process"

read -p "Enter the process name: " process_name

# Get the process ID
process_id=$(pgrep "$process_name")

# Check if process ID is empty
if [ -z "$process_id" ]; then
    echo "No process ID found for $process_name"
    exit 1
fi

# Confirm process ID was found
echo "Process ID(s) found: $process_id"
echo "Killing the process(es)..."

# Kill the process
kill $process_id

# Check if the kill command was successful
if [ $? -eq 0 ]; then
    echo "Process ID(s) $process_id killed successfully"
else
    echo "Failed to kill process ID(s) $process_id"
fi




