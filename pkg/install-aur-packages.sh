#!/bin/bash

echo "installing vim-plug"
ehco
if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo
echo "installing aur packages"
echo
TEMP_DIR=$(mktemp -d)
cd $TEMP_DIR

if ! pacman -Qs spotify > /dev/null; then 
	git clone https://aur.archlinux.org/spotify.git
	gpg --recv-keys 4773BD5E130D1D45
	cd spotify && makepkg -si --noconfirm && cd $TEMP_DIR
fi

if ! pacman -Qs slack > /dev/null; then 
	git clone https://aur.archlinux.org/slack-desktop.git
	cd slack-desktop && makepkg -si --noconfirm && cd $TEMP_DIR
fi

if ! pacman -Qs golang-dep > /dev/null; then 
	git clone https://aur.archlinux.org/golang-dep.git
	cd golang-dep && makepkg -si --noconfirm && cd $TEMP_DIR
fi

if ! pacman -Qs kubectl > /dev/null; then 
	git clone https://aur.archlinux.org/kubectl-bin.git
	cd kubectl-bin && makepkg -si --noconfirm && cd $TEMP_DIR
fi

if ! pacman -Qs ttf-symbola > /dev/null; then 
	git clone https://aur.archlinux.org/ttf-symbola.git
	cd ttf-symbola && makepkg -si --noconfirm && cd $TEMP_DIR
fi

if ! pacman -Qs zoom > /dev/null; then 
	git clone https://aur.archlinux.org/zoom.git
	cd zoom && makepkg -si --noconfirm && cd $TEMP_DIR
fi

if ! pacman -Qs dropbox > /dev/null; then 
	gpg --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
	git clone https://aur.archlinux.org/dropbox.git
	cd dropbox && makepkg -si --noconfirm && cd $TEMP_DIR
fi
