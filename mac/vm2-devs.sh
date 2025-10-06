#!/usr/bin/env zsh

SSHPORT=10002

NAME=vm2

VMFILE=$HOME/VMs/$NAME/$NAME.qcow2
EDK2_FILE=$HOME/VMs/$NAME/edk2.fd
OVMF_FILE=$HOME/VMs/$NAME/ovmf.fd
SHARED_PATH=$HOME/VMs/$NAME/share

# Special case, open all sorts of ports so apps can be accessed
# from the host for testing.
#
HOSTFWD="\
hostfwd=tcp:0.0.0.0:$SSHPORT-:22,\
hostfwd=tcp:0.0.0.0:8080-:8080,\
hostfwd=tcp:0.0.0.0:8000-:8000,\
hostfwd=tcp:0.0.0.0:4200-:4200,\
hostfwd=tcp:0.0.0.0:5005-:5005"

####################
# aarch64 Debian VM
####################

if pgrep -f "$NAME" > /dev/null; then
    echo "$NAME is already running"
    exit 0
fi

echo "Use Ctrl+A C to switch between serial and monitor console"
echo

if [[ "$1" == "txt" ]]; then
    qemu-system-aarch64 -M virt -accel hvf -smp 4 -m 12G -cpu cortex-a72 \
        -name $NAME \
        -hda $VMFILE \
        -drive "format=raw,file=$EDK2_FILE,if=pflash,readonly=on" \
        -drive "format=raw,file=$OVMF_FILE,if=pflash" \
        -device e1000,netdev=usernet -netdev "user,id=usernet,$HOSTFWD" \
        -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos -fsdev local,id=fsdev0,path=$SHARED_PATH,security_model=mapped-file \
        -device virtio-gpu-pci \
        -nographic
else
    qemu-system-aarch64 -M virt -accel hvf -smp 2 -m 8G -cpu cortex-a72 \
        -name $NAME \
        -serial mon:stdio \
        -hda $VMFILE \
        -drive "format=raw,file=$EDK2_FILE,if=pflash,readonly=on" \
        -drive "format=raw,file=$OVMF_FILE,if=pflash" \
        -device e1000,netdev=usernet -netdev "user,id=usernet,$HOSTFWD" \
        -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos -fsdev local,id=fsdev0,path=$SHARED_PATH,security_model=mapped-file \
        -device virtio-gpu-pci \
        -device usb-ehci \
        -device usb-kbd \
        -device usb-tablet \
        -device intel-hda \
        -device hda-duplex,audiodev=snd0 -audiodev coreaudio,id=snd0 \
        -display cocoa,show-cursor=off,zoom-to-fit=on,zoom-interpolation=on
fi
