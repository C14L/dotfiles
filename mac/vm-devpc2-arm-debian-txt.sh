#!/usr/bin/env zsh

SSHPORT=10002

NAME=devpc2

VMFILE=$HOME/VMs/$NAME-arm-debian.qcow2

SHARED_PATH=$HOME/VMs/$NAME-share

qemu-system-aarch64 -M virt -accel hvf -smp 2 -m 8G -cpu cortex-a72 \
    -hda $VMFILE \
    -drive "format=raw,file=$HOME/VMs/$NAME-edk2-arm.fd,if=pflash,readonly=on" \
    -drive "format=raw,file=$HOME/VMs/$NAME-ovmf-arm.fd,if=pflash" \
    -device e1000,netdev=usernet -netdev user,id=usernet,hostfwd=tcp:0.0.0.0:$SSHPORT-:22 \
    -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos \
    -fsdev local,id=fsdev0,path=$SHARED_PATH,security_model=mapped-file \
    -nographic

# GUI: TODO: make selector arg

# qemu-system-aarch64 -M virt \
#     -accel hvf \
#     -smp 4 -m 8G -cpu cortex-a72 \
#     -drive "format=raw,file=$HOME/VMs/$NAME-edk2-arm.fd,if=pflash,readonly=on" \
#     -drive "format=raw,file=$HOME/VMs/$NAME-ovmf-arm.fd,if=pflash" \
#     -hda $VMFILE \
#     -device e1000,netdev=usernet \
#     -netdev user,id=usernet,hostfwd=tcp:0.0.0.0:10000-:22 \
#     -device virtio-gpu-pci \
#     -device usb-ehci \
#     -device usb-kbd \
#     -device usb-tablet \
#     -display cocoa,show-cursor=on \
#     -fsdev local,id=fsdev0,path=$HOME/Repos,security_model=mapped-file \
#     -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos
