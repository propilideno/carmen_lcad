#!/bin/bash

LOG_FILE=/tmp/mpp.log

# Start background processes
~/carmen_lcad/bin/central &
CENTRAL_PID=$!

~/carmen_lcad/bin/proccontrol ~/carmen_lcad/bin/process-navigate-volta-da-ufes-pid.ini &
PROCCONTROL_PID=$!

# Define cleanup function
cleanup() {
    echo "Stopping scripts..."
    kill $CENTRAL_PID $PROCCONTROL_PID 2>/dev/null
    wait $CENTRAL_PID $PROCCONTROL_PID 2>/dev/null
    echo "Processes terminated."
}

# Trap script termination signals
trap cleanup SIGINT SIGTERM EXIT

# Wait for processes
for i in {1..25}; do # wait 10 seconds for the log file to appear
	[ -f $LOG_FILE ] && break
	sleep 0.25
done
[ -f $LOG_FILE ] && tail -f $LOG_FILE || { echo "No log file found."; wait; }
