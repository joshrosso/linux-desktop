#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "must run as root"
        exit
fi

# running commands to configure the system
printf "[main]\ndhcp=dhclient" > /etc/NetworkManager/conf.d/dhcp-client.conf
printf "[Policy]\nAutoEnable=true" > /etc/bluetooth/main.conf
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
systemctl enable NetworkManager
systemctl enable bluetooth
timedatectl set-ntp true

# disable annoying beep
echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist
mkinitcpio -p linux

# need to redo grub-mkconfig so it includes ucode launch before initramfs
grub-mkconfig -o /boot/grub/grub.cfg

localectl set-locale LANG=en_US.UTF-8