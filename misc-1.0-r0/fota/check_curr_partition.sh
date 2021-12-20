#!/bin/sh

# Script for checking the current partition

# partition file
TMP_FILE="/data/logs/tmp_rootfs_part"
PARTITION_FILE="/data/logs/curr_rootfs_part"

# check cases
PARTITION_A="1"
PARTITION_B="2"

# extracting the current partition
fw_printenv mmcpart > $TMP_FILE

# check the current status of the update
if grep -q $PARTITION_A "$TMP_FILE"; then
  echo $PARTITION_A > $PARTITION_FILE
elif grep -q $PARTITION_B "$TMP_FILE"; then
  echo $PARTITION_B > $PARTITION_FILE
else
  echo "Unknown partition!"
fi
rm $TMP_FILE               
#end of the script


