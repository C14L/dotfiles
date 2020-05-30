#!/bin/bash

HDD_PARTITION=/dev/disk/by-uuid/3c976efa-b5f8-4416-baf9-83539050ce41
HDD_MAPPED=space01_mapper
MOUNT_DIR=/space01

sudo umount $MOUNT_DIR

if [ -e /dev/mapper/$HDD_MAPPED ]; then
  sudo cryptsetup luksClose $HDD_MAPPED
fi

