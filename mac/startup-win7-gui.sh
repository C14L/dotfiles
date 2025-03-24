#!/usr/bin/env zsh

qemu-system-x86_64 -smp 4 -m 12G -cpu max \
    -hda "$HOME/VMs/win7-disk1.vmdk" \
    -nic none \
    -device virtio-gpu-pci \
    -device usb-ehci \
    -device usb-kbd \
    -device usb-tablet \
    -display cocoa,show-cursor=on
