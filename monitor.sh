#!/bin/bash
echo "Date: $(date)" > monitor.txt
echo "Highest 3 CPU-consuming processes" >> monitor.txt
echo "=================================" >> monitor.txt
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 4  >> monitor.txt
echo "" >> monitor.txt
echo "Interrupts" >> monitor.txt
echo "========================================================================================================================================================" >> monitor.log
cat /proc/interrupts | head -n 11 >> monitor.txt