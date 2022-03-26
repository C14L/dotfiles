#!/bin/bash

# TODO: Find the correct disk.
HDD_PARTITION=/dev/disk/by-uuid/e87b2971-1090-480d-a665-f9d463ba582c
HDD_MAPPED=wd4tb
MOUNT_DIR=/WD4TB

echo "Type two passwords: 1st the root password, 2nd the HDD password."

# Add the encrypted disk partition to the luks mapper
sudo cryptsetup luksOpen $HDD_PARTITION $HDD_MAPPED

# Make sure mount dir exists
mkdir -p $MOUNT_DIR

# Make sure mount dir is empty
test "$(ls -A $MOUNT_DIR 2>/dev/null)" && echo "Mount dir not empty!" && exit 1

# Mount the mapped HDD partition to the mount dir
sudo mount /dev/mapper/$HDD_MAPPED $MOUNT_DIR

