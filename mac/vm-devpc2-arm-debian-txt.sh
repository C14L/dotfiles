#!/usr/bin/env zsh

SSHPORT=10002

NAME=devpc2

VMFILE=$HOME/VMs/$NAME-arm-debian.qcow2

SHARED_PATH=$HOME/VMs/$NAME-share

HOSTFWD="\
hostfwd=tcp:0.0.0.0:$SSHPORT-:22,\
hostfwd=tcp:0.0.0.0:8080-:8080,\
hostfwd=tcp:0.0.0.0:8000-:8000,\
hostfwd=tcp:0.0.0.0:4200-:4200,\
hostfwd=tcp:0.0.0.0:5005-:5005"


if pgrep -f "$NAME" > /dev/null; then
    echo "$NAME is already running"
    exit 0
fi

if [[ "$1" == "gui" ]]; then
    qemu-system-aarch64 -M virt -accel hvf -smp 2 -m 8G -cpu cortex-a72 \
        -name $NAME \
        -monitor stdio \
        -hda $VMFILE \
        -drive "format=raw,file=$HOME/VMs/$NAME-edk2-arm.fd,if=pflash,readonly=on" \
        -drive "format=raw,file=$HOME/VMs/$NAME-ovmf-arm.fd,if=pflash" \
        -device e1000,netdev=usernet -netdev "user,id=usernet,$HOSTFWD" \
        -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos -fsdev local,id=fsdev0,path=$SHARED_PATH,security_model=mapped-file \
        -device virtio-gpu-pci \
        -device usb-ehci \
        -device usb-kbd \
        -device usb-tablet \
        -display cocoa,show-cursor=off,zoom-to-fit=on,zoom-interpolation=on
else
    qemu-system-aarch64 -M virt -accel hvf -smp 4 -m 12G -cpu cortex-a72 \
        -name $NAME \
        -hda $VMFILE \
        -drive "format=raw,file=$HOME/VMs/$NAME-edk2-arm.fd,if=pflash,readonly=on" \
        -drive "format=raw,file=$HOME/VMs/$NAME-ovmf-arm.fd,if=pflash" \
        -device e1000,netdev=usernet -netdev "user,id=usernet,$HOSTFWD" \
        -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos -fsdev local,id=fsdev0,path=$SHARED_PATH,security_model=mapped-file \
        -device virtio-gpu-pci \
        -nographic
fi

#        -boot d -cdrom $HOME/VMs/debian-12.10.0-arm64-netinst.iso \

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
