#!/bin/bash

echo "UNENCRYPTED backup 'chris-desktop' to a connected USB drive."
echo
echo "This backup is UNENCRYPTED! Only write to an encrypted USB drive!"
echo

DIR="backup_chris_desktop"

TRG=0
TRG1="/WD2TB/$DIR"
TRG2="/WD1TB/$DIR"
TRG3="/SD128GB_2/$DIR"
TRG4="/media/chris/backup01/$DIR"

TMPF="/tmp/desktop-rsync.log"
SRC="$HOME"

if [ -d $TRG1 ]; then TRG=$TRG1 ; fi
if [ -d $TRG2 ]; then TRG=$TRG2 ; fi
if [ -d $TRG3 ]; then TRG=$TRG3 ; fi
if [ -d $TRG4 ]; then TRG=$TRG4 ; fi

if [ $TRG == 0 ]; then
  echo
  echo "Please connect an external backup HDD:";
  echo
  echo "--> WD2TB";
  echo "--> WD1TB";
  echo "--> SD128GB";
  echo "--> backup01";
  echo
  exit 1;
fi

echo
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
    --exclude=.debug/ \
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
    --exclude=venv/ \
    --exclude="**/target/debug/" \
    --exclude="**/target/rls/" \
    "$SRC" "$TRG/" > $TMPF

echo
echo "Done."
echo

