#!/bin/bash
echo ""
if [ -z "$1" ]; then
    echo "No directory path provided. Please provide it with the command line argument. Ex: ./backup.sh /etc"
    exit 1
fi

timestamp=$(date +%Y%m%d_%H%M%S) #create timestamp 

backup_dir="/mnt/c/.../$timestamp" #creates destination path for backup files

mkdir -p "$backup_dir" #create the backup directory if it doesn't exist

count=0

for file in "$1"/*.conf; do
    if [ -f "$file" ]; then
        cp -p "$file" "$backup_dir/" #cp to copy w metadata 
        count=$((count + 1)) #increment counter
    fi
done

echo "Files backed up: $count"
echo "Backup location: $backup_dir"