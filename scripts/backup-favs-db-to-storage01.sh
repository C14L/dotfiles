#!/bin/bash

DIR=/tmp/favs-db-backup \
&& mkdir -p $DIR \
&& rsync -av $SERVER02:/opt/favs/sql-backups/* $DIR/ \
&& rsync -av -e 'ssh -p23' $DIR $STORAGE01:./
&& rm $DIR/* \
&& rmdir $DIR

