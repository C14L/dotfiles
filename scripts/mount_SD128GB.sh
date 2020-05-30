#!/bin/bash

PT1=/dev/disk/by-uuid/4636d58a-b31b-426a-be69-851d91ff1cd4
PT2=/dev/disk/by-uuid/0708359a-1de0-4cc8-aa94-3d242d6a675e
MAP1=sd128gb_1
MAP2=sd128gb_2
MOUNT_DIR_1=/SD128GB_1
MOUNT_DIR_2=/SD128GB_2


# Make sure mount dir exists
sudo mkdir -p $MOUNT_DIR_1
sudo mkdir -p $MOUNT_DIR_2

# Add the encrypted disk partition to the luks mapper
if [ ! -e /dev/mapper/$MAP2 ]; then
  sudo cryptsetup luksOpen $PT2 $MAP2
fi

# Make sure mount dir is empty
test "$(ls -A $MOUNT_DIR_2 2>/dev/null)" && echo "Mount dir not empty!" && exit 1

# Mount the mapped partition to the mount dir
sudo mount /dev/mapper/$MAP2 $MOUNT_DIR_2

# The first partition is a DOS boot partition and not encrypted
test "$(ls -A $MOUNT_DIR_1 2>/dev/null)" && echo "Mount dir 1 not empty!" && exit 1
sudo mount $PT1 $MOUNT_DIR_1

