#!/bin/bash

cd $CARMEN_HOME/bin # compatibility problems without it

LOG_FILE=/tmp/mpp.log

# Start background processes
$CARMEN_HOME/bin/central &
CENTRAL_PID=$!
sleep 2

$CARMEN_HOME/bin/proccontrol $CARMEN_HOME/bin/process-navigate-volta-da-ufes-pid.ini &
PROCCONTROL_PID=$!
sleep 1

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
