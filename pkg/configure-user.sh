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
  ${HOME}/.config/picom \
  ${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml

cp -fvr \
  ../dotfiles/.bash_aliases \
  ../dotfiles/.bash_profile \
  ../dotfiles/.bashrc \
  ../dotfiles/.gitconfig \
  ../dotfiles/.tmux.conf \
  ../dotfiles/.xinitrc \
  ../dotfiles/.Xresources \
  ${HOME}/

cp -vr ../dotfiles/.ssh/config ${HOME}/.ssh/
cp -vr ../dotfiles/.config/picom/picom.conf ${HOME}/.config/picom/
cp -vr ../dotfiles/.config/nvim/init.vim ${HOME}/.config/nvim/
cp -vr ../dotfiles/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml ${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml/

# update xfce settings
killall xfconfd
/usr/lib/xfce4/xfconf/xfconfd &
xfsettingsd --replace &
