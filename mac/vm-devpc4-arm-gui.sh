#!/usr/bin/env zsh

SSHPORT=10004

NAME=devpc4

VMFILE=$HOME/VMs/$NAME/$NAME.qcow2
EDK2_FILE=$HOME/VMs/$NAME/edk2.fd
OVMF_FILE=$HOME/VMs/$NAME/ovmf.fd
SHARED_PATH=$HOME/VMs/$NAME/share

####################
# aarch64 Debian VM
####################

if pgrep -f "$NAME" > /dev/null; then
    echo "$NAME is already running"
    exit 0
fi

qemu-system-aarch64 -M virt -accel hvf -smp 2 -m 8G -cpu cortex-a72 \
    -name $NAME \
    -monitor stdio \
    -hda $VMFILE \
    -drive "format=raw,file=$EDK2_FILE,if=pflash,readonly=on" \
    -drive "format=raw,file=$OVMF_FILE,if=pflash" \
    -device e1000,netdev=usernet -netdev user,id=usernet,hostfwd=tcp:0.0.0.0:$SSHPORT-:22 \
    -device virtio-gpu-pci \
    -device usb-ehci \
    -device usb-kbd \
    -device usb-tablet \
    -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos \
    -fsdev local,id=fsdev0,path=$SHARED_PATH,security_model=mapped-file \
    -display cocoa,show-cursor=off,zoom-to-fit=on,zoom-interpolation=on
 
    #  \
    # -device virtio-serial \
    # -chardev socket,path=/tmp/qemu-ga.sock,server=on,wait=off,id=qga0 \
    # -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0
