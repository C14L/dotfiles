#!/bin/bash

HDD_PARTITION=/dev/disk/by-uuid/0641b5f4-e335-470c-aba9-13b3a29fa7e6
HDD_MAPPED=wd1tb
MOUNT_DIR=/WD1TB

sudo umount $MOUNT_DIR

if [ -e /dev/mapper/$HDD_MAPPED ]; then
  sudo cryptsetup luksClose $HDD_MAPPED
fi

