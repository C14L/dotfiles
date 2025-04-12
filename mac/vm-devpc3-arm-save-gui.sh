#!/usr/bin/env zsh

SSHPORT=10003

NAME=devpc3

VMFILE=$HOME/VMs/$NAME-arm-save.qcow2

SHARED_PATH=$HOME/VMs/$NAME-share

qemu-system-aarch64 -M virt -accel hvf -smp 4 -m 8G -cpu cortex-a72 \
    -drive "format=raw,file=$HOME/VMs/devpc3-edk2-arm-save.fd,if=pflash,readonly=on" \
    -drive "format=raw,file=$HOME/VMs/devpc3-ovmf-arm-save.fd,if=pflash" \
    -hda $VMFILE \
    -device e1000,netdev=usernet -netdev user,id=usernet,hostfwd=tcp:0.0.0.0:$SSHPORT-:22 \
    -device virtio-gpu-pci \
    -device usb-ehci \
    -device usb-kbd \
    -device usb-tablet \
    -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos \
    -fsdev local,id=fsdev0,path=$SHARED_PATH,security_model=mapped-file \
    -display cocoa,show-cursor=on
 
    #  \
    # -device virtio-serial \
    # -chardev socket,path=/tmp/qemu-ga.sock,server=on,wait=off,id=qga0 \
    # -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0
