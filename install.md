# Install guide

This is my personal install guide. Do not use it to install your system.

* Validate Network
  * `ping archlinux.org`
  * Pings should work
* Set system clock to UTC
  * `timedatectl set-ntp true`
* Disks
  * Partition
    * `/dev/sda` is for Linux.
    * `parted /dev/sda`
    * `/dev/sda1` is EFI system partition. Mount at `/boot`.
    * `mkpart primary fat32 0% 551MiB`
    * `set 1 esp on`
    * `/dev/sda2` is 32 Gb `swap`
    * `mkpart primary linux-swap 551MiB 31068MiB`
    * `/dev/sda3` is `ext4` `/`
    * `mkpart primary ext4 31068MiB 100%`
    * /dev/sdb is passed through to Windows as whole block device. Ignore for now.
    * /dev/sdc is the data tank. Ignore for now.
  * Format
    * `mkfs.fat -F32 /dev/sda1`
    * `mkswap /dev/sda2`
    * `mkfs.ext4 /dev/sda3`
  * Mount
    * `mount /dev/sda3 /mnt`
    * `mkdir /mnt/boot`
    * `mount /dev/sda1 /mnt/boot`
    * `swapon /dev/sda2`
* Install packages
  * `pacstrap /mnt <packages>`
  * Add all the packags below in place of `<packages>`
    * `base`
    * `base-devel`
    * `sudo`
    * `neovim`
    * `zsh`
    * `i3-gaps`
    * `xorg-server`
    * `nvidia`
    * `qutebrowser`
    * `ranger`
    * `feh`
    * `rofi`
    * `kitty`
    * `intel-ucode`
  * There may be more. Inspect the old system and update this before next install.
* Generate `fstab`
  * `genfstab -U /mnt >> /mnt/etc/fstab`
* `arch-chroot /mnt`
* `git clone git@github.com:dchw/dotfiles.git`
* Set time zone
  * `ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime`
  * `hwclock --systohc`
* Set locales
  * `sed -i 's/#en_US.UTF-8/en-US.UTF-8/' /etc/locale.gen`
  * `locale-gen`
  * `echo "LANG=en_US.UTF-8" > /etc/locale.conf`
* Hostname
  * `echo twilight > /etc/hostname`
* Networking
  * Hosts File
    * Here are the contents:
    * `127.0.0.1  localhost`
    * `::1        localhost`
    * `127.0.1.1  twilight.localdomain twilight`
  * Adapter
    * `systemctl enable dhcpcd@enp0s25.service`
* Initramfs
  * `mkinitcpio -p linux`
* Bootloader
  * Install `systemd-boot`
    * `bootctl --path=/boot install`
  * Replace `loader.conf` with mine from Git
  * Replace `loaders/` with mine from Git
* Users
  * Root Password
    * `passwd`
  * My user
    * `useradd --create-home dchw -s /bin/zsh`
    * `passwd dchw`
    * `visudo`, add `dchw` to allowed sudoers
* Reboot and pray
  * `exit`
  * `umount -R /mnt`
  * `reboot`
* Remove USB media
