#!/bin/bash 
echo "Monitoring Dashboard" 
echo "----------------------------------------------" 

for i in {1..6} 
do 
    echo "Time: $(date)" 
    echo "Snapshot: $i of 6" 
    echo "" 

    echo "Top 5 CPU-consuming processes:" 
    echo "----------------------------------------------" 
    ps -eo pid,stat,%cpu,comm --sort=-%cpu | head -n 6 
    echo "" 

    echo "Process State Counts:" 
    echo "----------------------------------------------" 
    
    RUNNING=$(ps -eo stat= | grep -c '^R') 
    SLEEPING=$(ps -eo stat= | grep -c '^S') 
    ZOMBIE=$(ps -eo stat= | grep -c '^Z') 

    echo "Running (R): $RUNNING" 
    echo "Sleeping (S): $SLEEPING"
    echo "Zombie (Z): $ZOMBIE" 
    echo "==============================================" 
    echo "" 
    
    sleep 5 
    done 

echo "Monitoring complete..." 