#!/bin/sh

# Script for checking the current boot container

# container file
PARTITION_FILE="/data/logs/curr_bootloader_partition"

# extracting the current partition
mmc extcsd read /dev/mmcblk2 | grep "Boot Partition" | awk '{print $3}' > $PARTITION_FILE

#end of the script

