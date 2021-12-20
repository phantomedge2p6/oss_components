#!/bin/sh

# Script for checking the update status

# Log file
LOG_FILE="/logs/update_log"
STATUS_FILE="/logs/status"

# Checking artifact installed successfully
CHECK_COMPLETE="installed"
# INFO appear when update triggered
CHECK_PROGRESS="INFO"
# ERROR appear when update failed
CHECK_ERROR="ERR"

# update status
UPDATE_FAIL="1"
UPDATE_IN_PROGRESS="2"
UPDATE_DOWNLOADED="3"

# checking the current status of the update
if grep -q $CHECK_ERROR "$LOG_FILE"; then
  echo $UPDATE_FAIL > $STATUS_FILE
elif grep -q $CHECK_COMPLETE "$LOG_FILE"; then
  echo $UPDATE_DOWNLOADED > $STATUS_FILE
elif grep -q $CHECK_PROGRESS "$LOG_FILE"; then
  echo $UPDATE_IN_PROGRESS > $STATUS_FILE
else                       
#  echo "Unknown status"
  echo $UPDATE_IN_PROGRESS > $STATUS_FILE
fi
#end of the script

