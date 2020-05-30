#!/bin/bash

PT1=/dev/disk/by-uuid/4636d58a-b31b-426a-be69-851d91ff1cd4
PT2=/dev/disk/by-uuid/0708359a-1de0-4cc8-aa94-3d242d6a675e
MAP1=sd128gb_1
MAP2=sd128gb_2
MOUNT_DIR_1=/SD128GB_1
MOUNT_DIR_2=/SD128GB_2

sudo umount $MOUNT_DIR_1
sudo umount $MOUNT_DIR_2

if [ -e /dev/mapper/$MAP2 ]; then
  sudo cryptsetup luksClose $MAP2
fi

