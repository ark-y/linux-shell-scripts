#!/bin/bash
echo ""
if [ -z "$1" ]; then
    echo "No directory path provided. Please provide it with the command line argument. Ex: ./myfiles.sh /etc"
    exit 1
fi

echo "Exploring for configuration files: $1"
echo "==========================================================" > conf_files.log

count=0 #start a counter 

for file in "$1"/*.conf; do #search specifically for configuration files
    if [ -f "$file" ]; then #check that it is a regular file
        count=$((count + 1)) #iterate counter

        echo "File: $file" >> conf_files.log
        stat --format="Type: %F | Size: %s bytes | Permissions: %A" "$file" >> conf_files.log #format the stat outputs 
        echo "------------------------------------------------------------------------" >> conf_files.log #append 
    fi #close the if statement 
done #close do loop 

echo "Number of .conf files found: $count" >> conf_files.log 