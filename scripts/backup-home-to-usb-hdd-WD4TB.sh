#!/bin/bash

SUBDIR="backup-$(hostname)"

LOGFILE="/tmp/$SUBDIR.log"

SRC="$HOME"

TRG="/WD2TB/$SUBDIR"

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
    --exclude="$USER/Android/"                \
    --exclude="$USER/.cache/"                 \
    --exclude="$USER/.dbus"                   \
    --exclude="$USER/.local/share/Trash/"     \
    --exclude="$USER/.local/share/docker/"    \
    --exclude="$USER/.local/share/containers/" \
    --exclude="$USER/.config/BraveSoftware/"  \
    --exclude="$USER/.config/vivaldi/"        \
    --exclude="$USER/snap/"                   \
    --exclude="$USER/virtual_machines/"       \
    --exclude="$USER/venv/"                   \
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

