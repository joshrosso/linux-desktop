#!/bin/bash

echo "installing vim-plug"
echo
if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo
echo "installing aur packages"
echo
TEMP_DIR=$(mktemp -d)
cd $TEMP_DIR

if ! pacman -Q spotify > /dev/null; then 
	git clone https://aur.archlinux.org/spotify.git
	gpg --recv-keys 4773BD5E130D1D45
	cd spotify && makepkg -si --noconfirm && cd $TEMP_DIR
fi

if ! pacman -Q slack-desktop > /dev/null; then 
	git clone https://aur.archlinux.org/slack-desktop.git
	cd slack-desktop && makepkg -si --noconfirm && cd $TEMP_DIR
fi

if ! pacman -Q golang-dep > /dev/null; then 
	git clone https://aur.archlinux.org/golang-dep.git
	cd golang-dep && makepkg -si --noconfirm && cd $TEMP_DIR
fi

if ! pacman -Q kubectl-bin > /dev/null; then 
	git clone https://aur.archlinux.org/kubectl-bin.git
	cd kubectl-bin && makepkg -si --noconfirm && cd $TEMP_DIR
fi

if ! pacman -Q zoom > /dev/null; then 
	git clone https://aur.archlinux.org/zoom.git
	cd zoom && makepkg -si --noconfirm && cd $TEMP_DIR
fi

# needed for OBS-linux browser plugin
if ! pacman -Q gconf > /dev/null; then 
	git clone https://aur.archlinux.org/gconf.git
	cd gconf && makepkg -si --noconfirm && cd $TEMP_DIR
fi

# needed for OBS-linux browser plugin
if ! pacman -Q obs-linuxbrowser-bin > /dev/null; then 
	git clone https://aur.archlinux.org/obs-linuxbrowser-bin.git
	cd obs-linuxbrowser-bin && makepkg -si --noconfirm && cd $TEMP_DIR
fi

# needed for OBS-linux browser plugin
if ! pacman -Q cef-minimal > /dev/null; then 
	git clone https://aur.archlinux.org/cef-minimal.git
	cd cef-minimal && makepkg -si --noconfirm && cd $TEMP_DIR
fi

if ! pacman -Q dropbox > /dev/null; then 
	gpg --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
	git clone https://aur.archlinux.org/dropbox.git
	cd dropbox && makepkg -si --noconfirm && cd $TEMP_DIR
fi
