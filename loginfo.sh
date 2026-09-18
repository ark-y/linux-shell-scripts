#!/bin/bash
echo "Username: $USER" > log.txt
echo "" >> log.txt
echo "System uptime:$(uptime)" >> log.txt
echo "" >> log.txt
echo "Active running processes: $(ps aux | wc -l)" >> log.txt