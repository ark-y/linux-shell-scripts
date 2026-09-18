#!/bin/bash
echo "SYSTEM BOOT INFORMATION"
echo "==================================================================="

echo ""
echo "Hostname: $(hostname)"

echo ""
echo "Runlevel: $(who -r)"

echo ""
echo "First 5 lines of /etc/passwd"
head -n 5 /etc/passwd


echo ""
echo "-------------------------------------------------------------------"