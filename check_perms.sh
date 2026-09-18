#!/bin/bash
echo ""
if [ -z "$1" ]; then
    echo "No directory path provided. Please provide it with the command line argument. Ex: ./check_perms.sh /etc"
    exit 1
fi

echo "Checking for world-writable permissions in: $1"
echo "Permission Report for: $1" > perm_report.txt
echo "======================================================" >> perm_report.txt

count=0

for file in "$1"/*.conf; do
    if [ -f "$file" ]; then

        permissions=$(stat --format="%A" "$file")

        echo "File: $file" >> perm_report.txt
        echo "Permissions: $permissions" >> perm_report.txt

        if [ "${permissions:8:1}" = "w" ]; then #substring expansion to check if the 9th character (world write permission) is 'w'
            echo "ALERT: File is world-writable..." >> perm_report.txt
            count=$((count + 1))
        else
            echo "File is not world-writable" >> perm_report.txt
        fi

        echo "----------------------------------------" >> perm_report.txt
    fi
done

echo "World-writable files found: $count" >> perm_report.txt