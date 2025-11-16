#!/usr/bin/env bash

SSHPORT=10004
DISPLAY=socm
NAME=vm4

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

echo "Use Ctrl+A C to switch between serial and monitor console"
echo

qemu-system-aarch64 -M virt -accel hvf -smp 3 -m 12G -cpu cortex-a72 \
    -name "$NAME-$DISPLAY" \
    -hda $VMFILE \
    -serial mon:stdio \
    -drive "format=raw,file=$EDK2_FILE,if=pflash,readonly=on" \
    -drive "format=raw,file=$OVMF_FILE,if=pflash" \
    -device e1000,netdev=usernet -netdev user,id=usernet,hostfwd=tcp:0.0.0.0:$SSHPORT-:22 \
    -device virtio-gpu-pci \
    -device usb-ehci \
    -device usb-kbd \
    -device usb-tablet \
    -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos \
    -fsdev local,id=fsdev0,path=$SHARED_PATH,security_model=mapped-file \
    -device intel-hda \
    -device hda-duplex,audiodev=snd0 -audiodev coreaudio,id=snd0 \
    -display cocoa,show-cursor=off,zoom-to-fit=on,zoom-interpolation=on

echo
echo "VM $NAME-$DISPLAY shut down."
echo
