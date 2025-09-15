#!/usr/bin/env zsh

qemu-system-x86_64 -smp 2 -m 4G -cpu max \
    -name win7 \
    -hda "$HOME/VMs/win7-disk1.vmdk" \
    -nic none \
    -device virtio-gpu-pci \
    -device usb-ehci \
    -device usb-kbd \
    -device usb-tablet \
    -display cocoa,show-cursor=off,zoom-to-fit=on,zoom-interpolation=on
