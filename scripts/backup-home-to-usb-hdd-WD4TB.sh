#!/bin/bash

SUBDIR="backup-$(hostname)"

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
    --exclude="$USER/.cache/"                 \
    --exclude="$USER/.dbus"                   \
    --exclude="$USER/.local/share/Trash/"     \
    --exclude="$USER/snap/"                   \
    --exclude="$USER/**/Cache*"               \
    --exclude="$USER/**/*Cache/"              \
    --exclude="$USER/**/cache*"               \
    --exclude="$USER/**/*cache/"              \
    --exclude="$USER/**/Temp/"                \
    --exclude="$USER/**/temp/"                \
    --exclude="$USER/**/tmp/"                 \
    --exclude="$USER/**/target/debug/"        \
    --exclude="$USER/**/target/rls/"          \
    --exclude="$USER/**/*_skipbackup_*"       \
    "$SRC" "$TRG/" > $LOGFILE

touch "$TRG"
echo
echo "Done."
echo

