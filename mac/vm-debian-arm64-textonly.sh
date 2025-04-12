#!/usr/bin/env zsh

echo "Starting aarch64 Debian VM in textonly mode with ~/Repos shared directory..."

SSHPORT=10000

VMFILE=$HOME/VMs/debian-arm-disk.qcow2

SHARED_PATH=$HOME/Repos

qemu-system-aarch64 -M virt -accel hvf -smp 2 -m 8G -cpu cortex-a72 \
    -hda $VMFILE \
    -drive "format=raw,file=$HOME/VMs/edk2-aarch64-code.fd,if=pflash,readonly=on" \
    -drive "format=raw,file=$HOME/VMs/ovmf_vars.fd,if=pflash" \
    -device e1000,netdev=usernet -netdev user,id=usernet,hostfwd=tcp:0.0.0.0:$SSHPORT-:22 \
    -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos \
    -fsdev local,id=fsdev0,path=$SHARED_PATH,security_model=mapped-file \
    -nographic
