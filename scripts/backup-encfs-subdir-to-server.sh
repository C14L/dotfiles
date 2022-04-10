#!/bin/bash

# Mount read-only encrypted view of unencrypted local data
# Copy encfs xml file to backup folder for later decryption

[ -z "$SERVER01" ] && echo "Error: SERVER01 envvar not set." && exit 1

DIR="$1"
SRC="$HOME/$DIR"
TRG="$SERVER01:~/backup-$(hostname)-dirs/${DIR}_encfs"
SRC_ENCFS="/tmp/encfs-temp-for-${DIR}"
LOGFILE="/tmp/${DIR}.log"

# TODO: verify that the dir name is one alphanum or more
# and it is not empty (that would backup all of home) or
# has a slash or other special chars

# TODO

# verify that the directory actually exists
if [ -e "$SRC" ]; then
    echo "Backup of directory: $SRC"
    echo
else
    echo "Error: directory not found in user home: $SRC"
    exit 1
fi

# make sure the last run exited cleanly, otherwise user has
# to clean up manually
if [ -e "$SRC_ENCFS" ]; then
    echo "Error: Mount dir ${SRC_ENCFS} view already exists! Exiting..."
    exit 1
fi

mkdir -p "$SRC_ENCFS"

echo "Backup from: $SRC"
echo "Writing to : $TRG"
echo "Encfs temp : $SRC_ENCFS"
echo
read -p "Press [Enter] to start..."
echo
echo "Running rsync, please wait..."
echo "Logfile: $LOGFILE"
echo

echo "Created temporary folder $SRC_ENCFS ..."
encfs --reverse --idle=60 --extpass="cat /home/chris/.backuppwd" -o ro "$SRC" "$SRC_ENCFS"
echo "Copying encrypted view of files to server..."
rsync -aivP --delete --whole-file "$SRC_ENCFS/" "$TRG" > $LOGFILE
echo "Copying encfs XML file..."
rsync -aivP --whole-file $SRC/.encfs6.xml $TRG
echo "Unmounting encfs view..."
fusermount -u $SRC_ENCFS
echo "Removing temporary folder $SRC_ENCFS ..."
rmdir $SRC_ENCFS

