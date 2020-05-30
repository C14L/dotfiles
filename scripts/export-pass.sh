#!/usr/bin/env bash

# Based on:
# https://unix.stackexchange.com/a/170546

shopt -s nullglob globstar

PASSDIR=$HOME/.password-store
TARGETDIR=${1%/}
TARFILE="$TARGETDIR/pass.tar.gz"

[[ -d $TARGETDIR ]] || (echo "Targetdir not found." && exit)
[[ $PASSDIR == $TARGETDIR ]] && echo "Targetdir can not be passdir." && exit

echo "Exporting to: $TARGETDIR"

# 1. Export all individual pass files
for fsn in $(find $PASSDIR -type f -name "*.gpg"); do
    osn="${fsn/$PASSDIR\/}"
    osn="${osn%.gpg}"
    ftn="$TARGETDIR/export/$osn.txt"
    echo "$osn -> $(basename $ftn)"
    mkdir -p "$(dirname $ftn)"
    pass "$osn" > "$ftn"
    [[ -f "$ftn" ]] || (echo "Error: file was not written: $ftn" && exit)
done

# 2. Combine them into one .tar.gz archive
tar -cpzf "$TARFILE" "$TARGETDIR/export/"

# 3. Encrypt them symetrically with `gpg -c`
gpg -c "$TARFILE"

# 4. Use `shred` to delete the unencrypted files.
find "$TARGETDIR/export/" -type f -name "*.txt" -print0 | xargs -0 shred -u
find "$TARGETDIR/export/" -type d -print0 | xargs -0 rmdir
rmdir "$TARGETDIR/export"
shred -u "$TARFILE"

# TODO:
# The above can probably all done as a one-liner through
# pipes, to avoid any clear text to be written to disk.
#

