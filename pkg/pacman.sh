# requires sudo
pacman -Sy --needed $(<packages.txt)

#printf "[main]\ndhcp=dhclient" > /etc/NetworkManager/conf.d/dhcp-client.conf
#printf "[Policy]\nAutoEnable=true" > /etc/bluetooth/main.conf
#echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
#systemctl enable NetworkManager
#systemctl enable bluetooth
# enable time daemon
#timedatectl set-ntp true

# disable annoying beep
#echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist
#sudo mkinitcpio -p linux

# need to redo grub-mkconfig so it includes ucode launch before initramfs
#sudo grub-mkconfig -o /boot/grub/grub.cfg

#localectl set-locale LANG=en_US.UTF-8

# vim-plug

#curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

