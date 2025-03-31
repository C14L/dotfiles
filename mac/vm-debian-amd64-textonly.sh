#!/usr/bin/env zsh

echo "Starting Debian VM in GUI mode with ~/Repos shared directory..."

# the ovmf_vars_amd64.fd file was too large, truncating it worked
# truncate -s 1M ~/VMs/ovmf_vars_amd64.fd

qemu-system-x86_64 -smp 4 -m 8G -cpu max -machine q35 \
    -hda $HOME/VMs/debian-amd64-disk.qcow2 \
    -device e1000,netdev=user.0 -netdev user,id=user.0,hostfwd=tcp:0.0.0.0:10001-:22 \
    -nographic \
    -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos \
    -fsdev local,id=fsdev0,path=$HOME/Repos,security_model=mapped-file

# qemu-system-x86_64 -smp 4 -m 8G -cpu max -machine q35 \
#     -hda $HOME/VMs/debian-amd64-disk.qcow2 \
#     -device e1000,netdev=user.0 -netdev user,id=user.0,hostfwd=tcp:0.0.0.0:10001-:22 \
#     -device virtio -display cocoa,show-cursor=on \
#     -device usb-ehci \
#     -device usb-kbd \
#     -device usb-tablet \

# --------------

# NOTES
#
# -device virtio-gpu-pci -display cocoa,show-cursor=on \
# -chardev socket,path=/tmp/qemu-ga.sock,server=on,wait=off,id=qga0 \
# -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0 \
# -drive "format=raw,file=$HOME/VMs/edk2-x86_64-code.fd,if=pflash,readonly=on" \
# -drive "format=raw,file=$HOME/VMs/ovmf_vars_amd64.fd,if=pflash" \
#
# INSTALL:
#
# qemu-system-x86_64 -smp 4 -m 8G -cpu max \
#     -boot order=d \
#     -cdrom $HOME/VMs/debian-12.10.0-amd64-netinst.iso \
#     -hda $HOME/VMs/debian-amd64-disk.qcow2 \
#     -netdev user,id=user.0 -device e1000,netdev=user.0 \
#     -drive "format=raw,file=$HOME/VMs/edk2-x86_64-code.fd,if=pflash,readonly=on" \
#     -drive "format=raw,file=$HOME/VMs/ovmf_vars_amd64.fd,if=pflash" \
#     -machine q35 \
#     -device usb-ehci \
#     -device usb-kbd \
#     -device usb-tablet

