#!/usr/bin/env zsh

echo "Starting Debian VM in GUI mode with ~/Repos shared directory..."

qemu-system-aarch64 -M virt \
    -accel hvf \
    -smp 4 -m 8G -cpu cortex-a72 \
    -drive "format=raw,file=$HOME/VMs/edk2-aarch64-code.fd,if=pflash,readonly=on" \
    -drive "format=raw,file=$HOME/VMs/ovmf_vars.fd,if=pflash" \
    -hda $HOME/VMs/debian-arm-disk.qcow2 \
    -device e1000,netdev=usernet \
    -netdev user,id=usernet,hostfwd=tcp:0.0.0.0:10000-:22 \
    -device virtio-gpu-pci \
    -device usb-ehci \
    -device usb-kbd \
    -device usb-tablet \
    -display cocoa,show-cursor=on \
    -fsdev local,id=fsdev0,path=$HOME/Repos,security_model=mapped-file \
    -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos
