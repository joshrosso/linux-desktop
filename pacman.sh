# requires sudo
pacman -Sy --needed \
	alsa-utils \
	ansible \
	arandr \
	bash-completion \
	bluez \
	bluez-utils \
	chromium \
	ctags \
	dhclient \
	dmenu \
	dnsutils \
	docker \
	firefox \
  git \
	go \
	i3lock \
	i3status \
	imagemagick \
	intel-ucode \
	jdk10-openjdk \
	jq \
	mutt \
	neovim \
	net-tools \
	network-manager-applet \
	networkmanager \
	openconnect \
	openssh \
	pavucontrol \
	remmina \
	ripgrep \
  signal-desktop \
	terraform \
	the_silver_searcher \
	ttf-hack \
	ttf-inconsolata \
	volumeicon \
	xf86-video-intel
	xorg \
	xorg-xinit \
	yarn \
  blueman \
  libvncserver \
  nemo \
  pulseaudio-bluetooth \

printf "[main]\ndhcp=dhclient" > /etc/NetworkManager/conf.d/dhcp-client.conf
printf "[Policy]\nAutoEnable=true" > /etc/bluetooth/main.conf
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
systemctl enable NetworkManager
systemctl enable bluetooth
# enable time daemon
timedatectl set-ntp true

# disable annoying beep
echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist
sudo mkinitcpio -p linux

# need to redo grub-mkconfig so it includes ucode launch before initramfs
sudo grub-mkconfig -o /boot/grub/grub.cfg

localectl set-locale LANG=en_US.UTF-8

sudo cp -v usr/local/bin/importc /usr/local/bin/
