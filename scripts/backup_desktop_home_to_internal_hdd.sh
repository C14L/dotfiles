#!/bin/bash

TMPF="/tmp/desktop-rsync.log"
SRC="$HOME"
TRG="/space01/backup_chris_desktop"

echo "Backup Desktop $SRC to internal HDD $TRG"
echo

if [ -d "$TRG" ]; then
    echo "Target directory found."
    echo
else
    echo "Error: Target directory does not exist!"
    echo "Are you sure target drive is mounted on /space01 mount point?"
    exit 1
fi

echo "--> rsync: $SRC --> $TRG/"
echo
read -p "Press [Enter] to start..."
echo
echo "Running rsync, please wait..."
echo "Logfile: $TMPF"

rsync -avP --delete \
    --exclude=.dbus \
    --exclude=.cache/ \
    --exclude=.ccache/ \
    --exclude=.cargo/ \
    --exclude=.rustup/ \
    --exclude=.gradle/ \
    --exclude=.dart/ \
    --exclude=.dartServer/ \
    --exclude=.npm/ \
    --exclude=.npm-packages/ \
    --exclude=.local/share/Trash/ \
    --exclude=.local/share/Steam/ \
    --exclude=Android/ \
    --exclude=".AndroidStudio*" \
    --exclude=".PyCharm*/system/caches" \
    --exclude=".PyCharm*/system/log" \
    --exclude=.android/ \
    --exclude=.thumbnails/ \
    --exclude=snap/ \
    --exclude="**/target/debug/" \
    --exclude="**/target/rls/" \
    "$SRC" "$TRG/" > $TMPF

echo
echo "Done."
echo

