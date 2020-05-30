#!/bin/bash

# TODO: Find the correct disk.
HDD_PARTITION=/dev/disk/by-uuid/4f2de49a-4872-4405-9c33-6e350979f0b4
HDD_MAPPED=wd2tb
MOUNT_DIR=/WD2TB

echo "Type two passwords: 1st the root password, 2nd the HDD password."

# Add the encrypted disk partition to the luks mapper
sudo cryptsetup luksOpen $HDD_PARTITION $HDD_MAPPED

# Make sure mount dir exists
mkdir -p $MOUNT_DIR

# Make sure mount dir is empty
test "$(ls -A $MOUNT_DIR 2>/dev/null)" && echo "Mount dir not empty!" && exit 1

# Mount the mapped HDD partition to the mount dir
sudo mount /dev/mapper/$HDD_MAPPED $MOUNT_DIR

