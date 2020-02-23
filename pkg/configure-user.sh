#!/bin/bash

if [ "$EUID" -eq 0 ]
    then echo "do not run as root"
        exit
fi

ln -sf ${HOME}/.config/nvim/init ${HOME}/.vimrc

echo "installing vim-plug"
echo
if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

mkdir -p \
  ${HOME}/.ssh \
  ${HOME}/.config/nvim \
  ${HOME}/.config/picom

cp -fr \
  ../dotfiles/.bash_aliases \
  ../dotfiles/.bash_profile \
  ../dotfiles/.bashrc \
  ../dotfiles/.gitconfig \
  ../dotfiles/.tmux.conf \
  ../dotfiles/.xinitrc \
  ../dotfiles/.Xresources \
  ${HOME}/

cp -r ../dotfiles/.ssh/config ${HOME}/.ssh/
cp -r ../dotfiles/.config/picom/picom.conf ${HOME}/.config/picom/
cp -r ../dotfiles/.config/nvim/init.vim ${HOME}/.config/nvim/
