#!/usr/bin/env bash

subdirname="Videos"

echo "running backup..." \
&& srcdir="$HOME/$subdirname" \
&& mntdir="/tmp/chris/$subdirname" \
&& encdir="/tmp/chris/${subdirname}_encfs" \
&& srvdir="$SERVER01:/home/chris/backup-chris-thinkpad-dirs" \
&& mkdir -p "$mntdir" \
&& mkdir -p "$encdir" \
&& encfs "$encdir" "$mntdir" \
&& rsync -av "$srcdir/*" "$mntdir/" \
&& rsync -av "$encdir" "$srvdir/" \
&& fusermount -u "$mntdir" \
&& rmdir "$mntdir" \
&& rm -r "$encdir/" \
&& echo "done!"
