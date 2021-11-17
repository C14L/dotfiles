#!/bin/bash

MOUNTDIR="backup-$(hostname)-mount"
ENCFSDIR="backup-$(hostname)-encfs"

LOGFILE="/tmp/$SUBDIR.log"

SRC="$HOME"
TRG="/media/chris/WD4TB"

[ -z "$SERVER01" ] && echo "Error: SERVER01 envvar not set." && exit 1

SRV="$SERVER01:~/"

if [ -e "$TRG/$MOUNTDIR" ]; then
    echo "Target mount dir already exists! Exiting..."
    exit 1
fi

echo "Backup from..: $SRC"
echo "Writing to...: $TRG/$MOUNTDIR"
echo "Logfile......: $LOGFILE"

echo
echo "Mounting encfs directory: $TRG/$MOUNTDIR"

mkdir "$TRG/$MOUNTDIR"
# encfs "$TRG/$ENCFSDIR" "$TRG/$MOUNTDIR"
pass wlan-vpn/backups-2 | head -n1 | encfs --stdinpass "$TRG/$ENCFSDIR" "$TRG/$MOUNTDIR"

echo
echo "Running rsync, please wait..."

rsync -avP --delete                     \
    --exclude=".android/"               \
    --exclude=".cache/"                 \
    --exclude=".cargo/"                 \
    --exclude=".dbus"                   \
    --exclude=".debug/"                 \
    --exclude=".gradle/"                \
    --exclude=".dart/"                  \
    --exclude=".dartServer/"            \
    --exclude=".local/share/Trash/"     \
    --exclude=".local/share/Steam/"     \
    --exclude=".npm/"                   \
    --exclude=".npm-packages/"          \
    --exclude=".rustup/"                \
    --exclude=".thumbnails/"            \
    --exclude=".AndroidStudio*"         \
    --exclude=".PyCharm*/system/caches" \
    --exclude=".PyCharm*/system/log"    \
    --exclude="Android/"                \
    --exclude="snap/"                   \
    --exclude="Memes/"                  \
    --exclude="Random/"                 \
    --exclude="Repos/"                  \
    --exclude="RetroVirtualMachines/"   \
    --exclude="Server/"                 \
    --exclude="Software/"               \
    --exclude="Videos/"                 \
    --exclude="**/Cache*"               \
    --exclude="**/*Cache/"              \
    --exclude="**/cache*"               \
    --exclude="**/*cache/"              \
    --exclude="**/Temp/"                \
    --exclude="**/temp/"                \
    --exclude="**/tmp/"                 \
    --exclude="**/target/debug/"        \
    --exclude="**/target/rls/"          \
    "$SRC" "$TRG/$MOUNTDIR/" > "$LOGFILE"

touch "$TRG/$MOUNTDIR/backup-timestamp-$(date -u +'%Y-%m-%d')"

fusermount -u "$TRG/$MOUNTDIR"

touch "$TRG/$ENCFSDIR"
rmdir "$TRG/$MOUNTDIR"

echo "Local rsync completed. Now rsync to remote server01..."
# read -p "Press [Enter] to start..."

rsync -avP --delete "$TRG/$ENCFSDIR" "$SRV" > "$LOGFILE"

echo
echo "Done."
echo

