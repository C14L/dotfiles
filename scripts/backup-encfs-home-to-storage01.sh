#!/bin/bash

# Mount read-only encrypted view of unencrypted local data
# Copy encfs xml file to backup folder for later decryption

[ -z "$STORAGE01" ] && echo "Error: STORAGE01 envvar not set." && exit 1

SRC="$HOME"
TRG="$STORAGE01:backup-$(hostname)-encfs"
SRC_ENCFS="/tmp/encfs-temp-for-backup-home-to-storage01"
LOGFILE="/tmp/backup-home-to-storage01.log"

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
echo "*** Remember to backup data in /space/ separately! ***"
echo
echo "Created temporary folder $SRC_ENCFS ..."
encfs --reverse --idle=60 --extpass="cat /home/chris/.backuppwd" -o ro "$SRC" "$SRC_ENCFS"
echo "Copying encrypted view of files to server..."
rsync -e 'ssh -p23' -aivP --delete --whole-file "$SRC_ENCFS/" "$TRG" > $LOGFILE
echo "Copying encfs XML file..."
rsync -e 'ssh -p23' -aivP --whole-file "$SRC/.encfs6.xml" "$TRG"
echo "Unmounting encfs view..."
fusermount -u "$SRC_ENCFS"
echo "Removing temporary folder $SRC_ENCFS ..."
rmdir "$SRC_ENCFS"
echo
echo "*** Remember to backup data in /space/ separately! ***"
echo

