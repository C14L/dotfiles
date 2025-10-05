# QEMU with Linux on ARM MacOS Pro M4 Max

A short guide to get a Linux VM running on MacOS for Apple Silicon on
a MacBook Pro with M4 Max. Install Debian in text mode, then boot 
either in text of GUI mode. Mount a directory from the host machine
into Debian, and connect from host to guest system via SSH. VSCode 
and others can connect into the guest and run code there, so malicious
dependencies don't affect the host system.


## Keyboard shortcuts

- Control+A -> X  Exit QEMU immediately
- Control+A -> C  Access QEMU console (type "quit" to quit)


## Setup QEMU VM

First create a new virtual disk that grows in size only as needed up to the 
given limit.

```sh
qemu-img create -f qcow2 $HOME/VMs/debian-arm-disk.qcow2 20G
```

Now create another drive, but of a fixed size.

```sh
dd if=/dev/zero conv=sync bs=1m count=64 of=$HOME/VMs/ovmf_vars.fd
```

As [pointed out here](https://sleepymug.me/fragments/guide_mac_qemu.html), 
there appears to be a problem with the UEFI firmware on certain ARM chips
in connection with QEMU. Find the firmware for arm64 (put there by QEMU)
and copy it somewhere accessible:

```sh
find /opt/homebrew -name 'edk2-aarch64-code.fd'
/opt/homebrew/Cellar/qemu/8.2.2/share/qemu/edk2-aarch64-code.fd

cp /opt/homebrew/Cellar/qemu/8.2.2/share/qemu/edk2-aarch64-code.fd $HOME/VMs/
```

Now start the machine, but tell it to boot from "drive d", that's the CDROM 
where the bootable installation ISO is mounted.

```sh
qemu-system-aarch64 -M virt \
    -accel hvf \
    -smp 4 -m 8G -cpu cortex-a72 \
    -drive "format=raw,file=$HOME/VMs/edk2-aarch64-code.fd,if=pflash,readonly=on" \
    -drive "format=raw,file=$HOME/VMs/ovmf_vars.fd,if=pflash" \
    -hda $HOME/VMs/debian-arm-disk.qcow2 \
    -device e1000,netdev=usernet \
    -netdev user,id=usernet,hostfwd=tcp:0.0.0.0:10000-:22 \
    -nographic \
    -boot d -cdrom $HOME/VMs/debian-12.10.0-arm64-netinst.iso
```

## Run the QEMU VM

Remove the -boot and -cdrom arguments to have the machine start from its 
virtual disk.

The LUKS prompt is on the serial console, not graphical. Add -serial mon:stdio 
to your QEMU command. Boot output and prompt will appear in the host terminal. 
Type passphrase there blindly if needed; use Ctrl+a then c to switch between 
QEMU monitor and guest console.

```sh
qemu-system-aarch64 -M virt \
    -accel hvf \
    -smp 4 -m 8G -cpu cortex-a72 \
    -drive "format=raw,file=$HOME/VMs/edk2-aarch64-code.fd,if=pflash,readonly=on" \
    -drive "format=raw,file=$HOME/VMs/ovmf_vars.fd,if=pflash" \
    -hda $HOME/VMs/debian-arm-disk.qcow2 \
    -device e1000,netdev=usernet \
    -netdev user,id=usernet,hostfwd=tcp:0.0.0.0:10000-:22 \
    -nographic \
    -fsdev local,id=fsdev0,path=$HOME/Repos,security_model=mapped-file \
    -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_repos
```

Connect via SSH to the QEMU VM with the user created during OS install.

```sh
ssh -p 10000 chris@localhost
```

## Mount the host directory in the guest VM

On the guest system, create a mount point and mount the directory from the 
host there.

```sh
mkdir -p /home/chris/Repos
sudo mount -t 9p -o trans=virtio,version=9p2000.L host_repos /home/chris/Repos
```

To add the mount automatically when the VM boots, add 
`host_repos /home/chris/Repos 9p trans=virtio,version=9p2000.L,rw 0 0`
to the `/etc/fstab` file.


## Run with GUI

For a GUI and seamless mouse pointer integration, simply add a display device 
and some input devices. Great for fullscreen, to have a Linux OS on one macOS
desktop, and macOS on the other.

```sh
qemu-system-aarch64 -M virt \
    -accel hvf \
    -smp 2 -m 8G -cpu cortex-a72 \
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
```


## Sources

- https://sleepymug.me/fragments/guide_mac_qemu.html
- https://ricardobalk.nl/blog/linux/debian-on-macos
- https://unix.stackexchange.com/q/682733

