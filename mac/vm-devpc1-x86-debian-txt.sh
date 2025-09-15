#!/usr/bin/env zsh

SSHPORT=10001

NAME=devpc1

VMFILE=$HOME/VMs/$NAME/$NAME.qcow2
SHARED_PATH=$HOME/VMs/$NAME/share
#
# Files edk2.fd and ovmf.fd are not needed apparently

###################
# x86-64 Debian VM
###################

if pgrep -f "$NAME" > /dev/null; then
    echo "$NAME is already running"
    exit 0
fi

if [[ "$1" == "gui" ]]; then
    qemu-system-x86_64 -smp 8 -m 12G -cpu max -machine q35 \
        -name $NAME \
        -monitor stdio \
        -hda $VMFILE \
        -device e1000,netdev=user.0 -netdev user,id=user.0,hostfwd=tcp:0.0.0.0:$SSHPORT-:22 \
        -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos -fsdev local,id=fsdev0,path=$SHARED_PATH,security_model=mapped-file \
        -device virtio-gpu-pci \
        -device usb-ehci \
        -device usb-kbd \
        -device usb-tablet \
        -display cocoa,show-cursor=off,zoom-to-fit=on,zoom-interpolation=on
else
    qemu-system-x86_64 -smp 4 -m 8G -cpu max -machine q35 \
        -name $NAME \
        -hda $VMFILE \
        -device e1000,netdev=user.0 -netdev user,id=user.0,hostfwd=tcp:0.0.0.0:$SSHPORT-:22 \
        -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos \
        -fsdev local,id=fsdev0,path=$SHARED_PATH,security_model=mapped-file \
        -nographic
fi
