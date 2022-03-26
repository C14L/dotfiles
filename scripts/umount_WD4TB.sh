#!/bin/bash

HDD_PARTITION=/dev/disk/by-uuid/e87b2971-1090-480d-a665-f9d463ba582c
HDD_MAPPED=wd4tb
MOUNT_DIR=/WD4TB

sudo umount $MOUNT_DIR

if [ -e /dev/mapper/$HDD_MAPPED ]; then
  sudo cryptsetup luksClose $HDD_MAPPED
fi

