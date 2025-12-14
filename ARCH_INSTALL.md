# Arch Linux Installation Guide

Personal guide.  
Written for my own needs and system.  
Use only after adapting it to your own configuration.

### Connect to the internet

Links:

- [Connect to the Internet](https://wiki.archlinux.org/title/Installation_guide#Connect_to_the_internet)
- [iwctl (wireless daemon)](https://wiki.archlinux.org/title/Iwd#iwctl)

```text
iwctl

[iwd]#:
device list
station device_name scan
station device_name get-networks
station device_name connect SSID
exit

ping google.com
```

### Partition the disks

Links:

- [Partition the disks](https://wiki.archlinux.org/title/Installation_guide#Partition_the_disks)
- [Partitioning tool](https://wiki.archlinux.org/title/Partitioning#Partitioning_tools)
- [Parted](https://wiki.archlinux.org/title/Parted#Installation)

```bash
lsblk #list block devices

parted /dev/nvme0n1
mklabel gpt
mkpart "UEFI" fat32 1MiB 1025MiB
set 1 esp on
mkpart "root" ext4 1025MiB 100%
quit
```

### Encrypting the Partition

Link:

- [Encrypting an entire system](https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#Preparing_the_disk_3)

```bash
cryptsetup lnvme0n1uksFormat /dev/nvme0n1p2
cryptsetup open /dev/nvme0n1p2 cryptlvm
```

```bash
pvcreate /dev/mapper/cryptlvm
vgcreate archvg /dev/mapper/cryptlvm

lvcreate -l 100%FREE -n root archvg
```

### Format the partitions

```bash
mkfs.ext4 /dev/archvg/root
mkfs.fat -F 32 /dev/nvme0n1p1
```

### Mount the file systems

```bash
mount /dev/archvg/root /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot
```

### Install packages

```bash
pacstrap -K /mnt base linux linux-firmware base-devel lvm2 dhcpcd net-tools iproute2 iwd nvim grub efibootmgr os-prober
```

### Configure the system

Links:

- [Configure the system](https://wiki.archlinux.org/title/Installation_guide#Configure_the_system)
- [Users and groups](https://wiki.archlinux.org/title/Users_and_groups)

#### Fstab

```bash
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
```

#### Time

```bash
ln -sf /usr/share/zoneinfo/Europe/City /etc/localtime
hwclock --systohc
```

#### Localization

```bash
nvim /etc/locale.gen
```

Uncomment en_US.UTF-8, uk_UA.UTF-8

```bash
locale-gen
```

#### Set the hostname

```bash
echo "arch" > /etc/hostname
```

#### User

```bash
# Set a secure password for the root user
passwd

# Add a new user
useradd -m -G wheel,users,video -s /bin/bash username
passwd username
```

Grant sudo permissions

```bash
sudo EDITOR=nvim visudo
```

Uncomment the following line

```bash
%wheel ALL=(ALL:ALL) ALL
```

#### Enable network services

```bash
systemctl enable dhcpcd
systemctl enable iwd.service
```

#### Configuring mkinitcpio

Link:

- [Configuring mkinitcpio](https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#Configuring_mkinitcpio_3)

```bash
nvim /etc/mkinitcpio.conf
```

Find the line starting with HOOKS= and insert sd-encrypt lvm2 after block, e.g.:

```bash
HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block sd-encrypt lvm2 filesystems fsck)
```

#### Generation mkinitcpio

```bash
mkinitcpio -P
```

### Boot loader

Links:

- [Boot loader](https://wiki.archlinux.org/title/Arch_boot_process#Boot_loader)
- [GRUB](https://wiki.archlinux.org/title/GRUB)
- [Configuring the boot loader](https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#Configuring_the_boot_loader_2)

```bash
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
nvim /etc/default/grub
```

Add the following line (replace with the actual UUID from blkid)

```bash
:r !blkid /dev/nvme0n1p2

GRUB_CMDLINE_LINUX="rd.luks.name=device-UUID=cryptlvm root=/dev/archvg/root"
```

Uncomment the following line

```bash
GRUB_DISABLE_OS_PROBER=false
```

Then generate the configuration

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

### Finally, exit and reboot:

```bash
Ctrl+D
umount -R /mnt
reboot
```
