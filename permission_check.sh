#!/bin/bash
echo "Configuration File Permissions Report" > conf_report.txt
echo "----------------------------------------------" >> conf_report.txt

echo "Checking Configuration File Permissions in /etc..."

#define variable here 
world_writable=0

#loop through all .conf files in /etc
for file in /etc/*.conf
do
    #check that the file exists and is a regular file
    if [ -f "$file" ]; then

        info=$(stat -c "%n %U %G %A" "$file") #get the info

        echo "$info" >> conf_report.txt

        permissions=$(stat -c "%A" "$file") #get permissions seperately to check for world-writable

        if [[ "$permissions" == *w*w* ]]; then 
            echo "<< WORLD-WRITABLE FILE FOUND >> $file" >> conf_report.txt #alert for WW
            ((world_writable++)) #increment counter for world-writable files 
        fi
    fi
done

echo "" >> conf_report.txt
echo "Total world-writable files: $world_writable" >> conf_report.txt