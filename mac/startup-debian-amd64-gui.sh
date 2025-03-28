#!/usr/bin/env zsh

echo "Starting Debian VM in GUI mode with ~/Repos shared directory..."

# the ovmf_vars_amd64.fd file was too large, truncating it worked
# truncate -s 1M ~/VMs/ovmf_vars_amd64.fd

qemu-system-x86_64 \
    -smp 4 -m 8G -cpu max \
    -drive "format=raw,file=$HOME/VMs/edk2-x86_64-code.fd,if=pflash,readonly=on" \
    -drive "format=raw,file=$HOME/VMs/ovmf_vars_amd64.fd,if=pflash" \
    -hda $HOME/VMs/debian-amd64-disk.qcow2 \
    -device e1000,netdev=usernet \
    -netdev user,id=usernet,hostfwd=tcp:0.0.0.0:10001-:22 \
    -device virtio-gpu-pci \
    -device usb-ehci \
    -device usb-kbd \
    -device usb-tablet \
    -display cocoa,show-cursor=on
    # -fsdev local,id=fsdev0,path=$HOME/Repos,security_model=mapped-file \
    # -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos
    # -boot d -cdrom $HOME/VMs/debian-12.10.0-amd64-netinst.iso \
    # -nographic \
