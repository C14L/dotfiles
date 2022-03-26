#!/bin/bash

SUBDIR="backup-$(hostname)-mount"

LOGFILE="/tmp/$SUBDIR.log"

SRC="$HOME"

TRG="/WD4TB/$SUBDIR"

echo "Backup from: $SRC"
echo "Writing  to: $TRG/"
echo
read -p "Press [Enter] to start..."
echo
echo "Running rsync, please wait..."
echo "Logfile: $LOGFILE"
echo

mkdir -p "$TRG"

rsync -avP --delete                           \
    --exclude="chris/.android/"               \
    --exclude="chris/.cache/"                 \
    --exclude="chris/.cargo/"                 \
    --exclude="chris/.dbus"                   \
    --exclude="chris/.debug/"                 \
    --exclude="chris/.gradle/"                \
    --exclude="chris/.dart/"                  \
    --exclude="chris/.dartServer/"            \
    --exclude="chris/.local/share/Trash/"     \
    --exclude="chris/.local/share/Steam/"     \
    --exclude="chris/.config/BraveSoftware"   \
    --exclude="chris/.config/Code"            \
    --exclude="chris/.npm/"                   \
    --exclude="chris/.npm-packages/"          \
    --exclude="chris/.rustup/"                \
    --exclude="chris/.thumbnails/"            \
    --exclude="chris/.AndroidStudio*"         \
    --exclude="chris/.PyCharm*/system/caches" \
    --exclude="chris/.PyCharm*/system/log"    \
    --exclude="chris/Android/"                \
    --exclude="chris/snap/"                   \
    --exclude="chris/Server/"                 \
    --exclude="chris/Downloads/"              \
    --exclude="chris/Movies/"                 \
    --exclude="chris/**/Cache*"               \
    --exclude="chris/**/*Cache/"              \
    --exclude="chris/**/cache*"               \
    --exclude="chris/**/*cache/"              \
    --exclude="chris/**/Temp/"                \
    --exclude="chris/**/temp/"                \
    --exclude="chris/**/tmp/"                 \
    --exclude="chris/**/target/debug/"        \
    --exclude="chris/**/target/rls/"          \
    "$SRC" "$TRG/" > $LOGFILE

touch "$TRG"
echo
echo "Done."
echo

