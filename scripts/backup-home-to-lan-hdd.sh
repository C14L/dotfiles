#!/bin/bash

SUBDIR="backup-$(hostname)"

LOGFILE="/tmp/$SUBDIR.log"

SRC="$HOME"

TRG="$NETBOOK01:/WD2TB/$SUBDIR"

echo "Backup from: $SRC"
echo "Writing  to: $TRG/"
echo
read -p "Press [Enter] to start..."
echo
echo "Running rsync, please wait..."
echo "Logfile: $LOGFILE"
echo

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
    --exclude="**/Cache*"               \
    --exclude="**/*Cache/"              \
    --exclude="**/cache*"               \
    --exclude="**/*cache/"              \
    --exclude="**/Temp/"                \
    --exclude="**/temp/"                \
    --exclude="**/tmp/"                 \
    --exclude="**/target/debug/"        \
    --exclude="**/target/rls/"          \
    "$SRC" "$TRG/" > $LOGFILE

echo
echo "Done."
echo

