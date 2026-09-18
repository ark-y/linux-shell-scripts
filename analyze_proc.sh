#!/bin/bash

# Check that a PID was provided
if [ -z "$1" ]; then
    echo "Please execute with a process ID: ./analyze_proc.sh <PID>"
    exit 1
fi

PID=$1

# Check that the process exists
if [ ! -d "/proc/$PID" ]; then
    echo "Error: Process with PID $PID does not exist."
    exit 1
fi

#name
name=$(cat "/proc/$PID/comm")

#priority
prio=$(awk '{print $18}' "/proc/$PID/stat")

# Voluntary context switches
vol=$(grep "^voluntary_ctxt_switches:" "/proc/$PID/status" | awk '{print $2}')

# Non-voluntary context switches
nonvol=$(grep "^nonvoluntary_ctxt_switches:" "/proc/$PID/status" | awk '{print $2}')


echo "Process Information"
echo "-------------------------------------------"
echo "PID:                         $PID"
echo "Process name:                $name"
echo "Priority:                    $prio"
echo "Voluntary context switches:  $vol"
echo "Non-voluntary context switches: $nonvol"
echo "-------------------------------------------"