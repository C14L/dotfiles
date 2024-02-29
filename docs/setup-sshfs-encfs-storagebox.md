Storagebox with sshfs and encfs
===============================


Mount existing remote dirs with encrypted content:
--------------------------------------------------

Mount entire storagebox server

    sshfs -p23 $STORAGE01: /tmp/storagemount -o auto_unmount,uid=`id -u $USER`,gid=`id -g $USER`


Make new remote encrypted dirs:
-------------------------------

Make a local mount point to mount the remote dir on

    mkdir -p /tmp/storagemount

Mount the remote dir to local dir, but under regular user

    sshfs -p23 $STORAGE01:testdir /tmp/storagemount -o auto_unmount,uid=`id -u $USER`,gid=`id -g $USER`

Make a local encfs dir inside the storage mount

    mkdir -p /tmp/storagemount/encdir

Use that dir to store the encrypted part

    encfs /tmp/storagemount/encdir/ /tmp/localdir/

Now, when writing to `/tmp/localdir` it shows up encrypted in remote `testdir` on the storagebox.

Unmount in reverse order

    fusermount -u /tmp/localdir
    fusermount -u /tmp/storagemount

