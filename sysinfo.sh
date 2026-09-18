#!/bin/bash
echo "System Report for $USER" > sys_report.txt
echo "" >> sys_report.txt
echo "CPU Info" >> sys_report.txt
echo "==========================================================" >> sys_report.txt
echo "" >> sys_report.txt
lscpu | grep "Model name" | sed 's/Model name:[[:space:]]*/Model name: /' >> sys_report.txt
echo "" >> sys_report.txt
echo "Kernel Version: $(uname -r)" >> sys_report.txt