#!/bin/bash
echo ""
if [ -z "$1" ]; then
    echo "No directory path provided. Please provide it with the command line argument. Ex: ./explorer.sh /etc"
    exit 1
fi

echo ""
echo "Exploring: $1"

for file in "$1"/*; do #list all the files in the directory 
    echo ""
    echo "File: $file"
    stat --format="Type: %F | Size: %s bytes | Permissions: %A" "$file"
    echo "------------------------------------------------------------------------" 
done