#!/bin/sh

# Script for checking the current partition

# partition file
TMP_FILE="/data/logs/tmp_apps_part"
PARTITION_FILE="/data/logs/curr_apps_part"

# check cases
PARTITION_A="1"
PARTITION_B="2"

# extracting the current partition
fw_printenv appspart > $TMP_FILE

# check the current status of the update
if grep -q $PARTITION_A "$TMP_FILE"; then
  echo $PARTITION_A > $PARTITION_FILE
  mkdir /apps
  mount /dev/mmcblk2p5 /apps
elif grep -q $PARTITION_B "$TMP_FILE"; then
  echo $PARTITION_B > $PARTITION_FILE
  mkdir /apps
  mount /dev/mmcblk2p6 /apps
else
  echo "Unknown partition!"
fi
rm $TMP_FILE
rm $PARTITION_FILE
#end of the script

