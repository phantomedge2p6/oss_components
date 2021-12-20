#!/bin/sh

# Script for switching the CCU board to serial downloader mode (UUU flashing)
CURR_BOOTPART=$(mmc extcsd read /dev/mmcblk2 | grep "Boot Partition" | awk '{print $3}')
echo $CURR_BOOTPART
if [ $CURR_BOOTPART = "1" ]; then
        echo 0 > /sys/block/mmcblk2boot0/force_ro
	dd if=/dev/zero of=/dev/mmcblk2boot0 bs=1k seek=32 conv=fsync count=256
	dd if=/dev/zero of=/dev/mmcblk2boot0 bs=1k seek=4096 conv=fsync count=256
	echo 1 > /sys/block/mmcblk2boot0/force_ro
else
	echo 0 > /sys/block/mmcblk2boot1/force_ro
	dd if=/dev/zero of=/dev/mmcblk2boot1 bs=1k seek=32 conv=fsync count=256
	dd if=/dev/zero of=/dev/mmcblk2boot1 bs=1k seek=4096 conv=fsync count=256
	echo 1 > /sys/block/mmcblk2boot1/force_ro
fi
