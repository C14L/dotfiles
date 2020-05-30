#!/bin/bash

# TODO: Find the correct disk.
HDD_PARTITION=/dev/disk/by-uuid/0641b5f4-e335-470c-aba9-13b3a29fa7e6
HDD_MAPPED=wd1tb
MOUNT_DIR=/WD1TB

# Add the encrypted disk partition to the luks mapper
if [ ! -e /dev/mapper/$HDD_MAPPED ]; then
  sudo cryptsetup luksOpen $HDD_PARTITION $HDD_MAPPED
fi

# Make sure mount dir exists
mkdir -p $MOUNT_DIR

# Make sure mount dir is empty
test "$(ls -A $MOUNT_DIR 2>/dev/null)" && echo "Mount dir not empty!" && exit 1

# Mount the mapped HDD partition to the mount dir
sudo mount /dev/mapper/$HDD_MAPPED $MOUNT_DIR

