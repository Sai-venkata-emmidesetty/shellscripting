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

#${file%.jpg}:


#The syntax ${variable%pattern} removes the shortest match of the specified pattern (.jpg in this case) from the end of the value stored in file.
#For example:
      #If file="image.jpg", then ${file%.jpg} evaluates to image.
      #If file="picture.jpg", then ${file%.jpg} evaluates to picture.
#.jpeg:

      #This is the new extension added to the filename after .jpg is removed.
#"${file%.jpg}.jpeg":

      #Combines the base filename (with .jpg removed) with the new .jpeg extension.
#For example:
      #If file="image.jpg", this evaluates to image.jpeg.

