#!/bin/bash

# Mount read-only encrypted view of unencrypted local data
# Copy encfs xml file to backup folder for later decryption

DIR="Testdir"

[ -z "$SERVER01" ] && echo "Error: SERVER01 envvar not set." && exit 1

SRC="$HOME/$DIR"
TRG="$SERVER01:~/backup-$(hostname)-dirs/${DIR}_encfs"
SRC_ENCFS="/tmp/encfs-temp-for-${DIR}"
LOGFILE="/tmp/${SUBDIR}.log"

if [ -e "$SRC_ENCFS" ]; then
    echo "Mount dir for encfs view already exists! Exiting..."
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

