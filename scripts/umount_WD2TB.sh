#!/bin/bash

HDD_PARTITION=/dev/disk/by-uuid/4f2de49a-4872-4405-9c33-6e350979f0b4
HDD_MAPPED=wd2tb
MOUNT_DIR=/WD2TB

sudo umount $MOUNT_DIR

if [ -e /dev/mapper/$HDD_MAPPED ]; then
  sudo cryptsetup luksClose $HDD_MAPPED
fi

