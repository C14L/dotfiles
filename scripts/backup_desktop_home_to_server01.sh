#!/bin/bash

TMPF="/tmp/backup-desktop-to-space01-and-server01.log"
SRC="$HOME"
ENCFS_MOUNT="/space01/backup_chris_desktop_mounted"
ENCFS_CRYPT="/space01/backup_chris_desktop_encfs"

[ -z "$SERVER01" ] && echo "Error: SERVER01 envvar not set." && exit 1

SRV="$SERVER01:~/"

echo "Writes an exncfs encryptd backup to /space01 and"
echo "then uploads the encrypted backup to server01."
echo
echo "Logfile: $TMPF"
echo

if [ -d "$ENCFS_CRYPT" ]; then
    echo "Encfs backup on internal HDD found."
else
    echo "Error: Internal HDD or encfs backup not found!"
    echo "Are you sure it is mounted on '/space01'?"
    exit 1
fi

echo
echo "Mounting $ENCFS_MOUNT"
mkdir -p "$ENCFS_MOUNT"
if [[ ! -z `ls -A "$ENCFS_MOUNT"` ]]; then
    echo "Error: Mount dir is not empty!"
    exit 1
fi
pass wlan-vpn/backups-2 | head -n1 | encfs --stdinpass "$ENCFS_CRYPT" "$ENCFS_MOUNT"
#if [[ -z `ls -A "$ENCFS_MOUNT"` ]]; then
#    echo "Error: Mount dir is empty after mounting! Could not mount encfs dir."
#    exit 1
#fi

echo
read -p "Press [RETURN] to start..."

echo
echo "Writing backup to encfs mount on internal HDD..."
rsync -avP --delete \
    --exclude="Android/" \
    --exclude="Server/" \
    --exclude="snap/" \
    --exclude=".android/" \
    --exclude=".AndroidStudio*" \
    --exclude=".cache/" \
    --exclude=".ccache/" \
    --exclude=".cargo/" \
    --exclude=".config/google-chrome/" \
    --exclude=".debug/" \
    --exclude=".dbus" \
    --exclude=".debug/" \
    --exclude=".gradle/" \
    --exclude=".dart/" \
    --exclude=".dartServer/" \
    --exclude=".npm/" \
    --exclude=".npm-packages/" \
    --exclude=".local/share/Trash/" \
    --exclude=".local/share/Steam/" \
    --exclude=".PyCharm*/system/caches" \
    --exclude=".PyCharm*/system/log" \
    --exclude=".rustup/" \
    --exclude=".thumbnails/" \
    --exclude="**/target/debug/" \
    --exclude="**/target/rls/" \
    "$SRC" "$ENCFS_MOUNT/" > $TMPF

echo
echo "Unmounting encfs directory on internal HDD..."
fusermount -u "$ENCFS_MOUNT"
rmdir "$ENCFS_MOUNT"
if [ -d "$ENCFS_MOUNT" ]; then
    echo "Error: Could not remove unmounted mount dir! Not unmounted?"
    exit 1
fi

echo
echo "Uploading encfs encrypted directory to remote 'server01'..."
rsync -avP --delete "$ENCFS_CRYPT" "$SRV"

echo "Done."

