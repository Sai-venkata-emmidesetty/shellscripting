#!/bin/bash

echo "Renaming all the files in the directory from .jpg to .jpeg"

# Flag to track if any files are renamed
files_renamed=false

# Loop through all .jpg files in the current directory
for file in *.jpg; do
    # Check if the file exists (handles cases where no .jpg files exist)
    if [ -e "$file" ]; then
        # Rename the file
        mv "$file" "${file%.jpg}.jpeg"
        echo "Rename successful: $file -> ${file%.jpg}.jpeg"
        files_renamed=true
    fi
done

# If no files were renamed, print a message
if ! $files_renamed; then
    echo "No .jpg files found in the directory."
fi

# -------------------------------------------------------------------
#  ${file%.jpg} removes the .jpg suffix from the filename.
# -------------------------------------------------------------------
# -e checks if the file exists in the directory
#--------------------------------------------------------------------
