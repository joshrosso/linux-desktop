#!/bin/bash

if [ "$EUID" -eq 0 ]
    then echo "do not run as root"
        exit
fi

echo "installing vim-plug"
echo
if [ ! -e ${HOME}/.vim/autoload/plug.vim ]; then
  curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

mkdir -p \
  ${HOME}/s \
  ${HOME}/.ssh \
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
  ../dotfiles/.xbindkeysrc \
  ${HOME}/

cp -vr ../dotfiles/.ssh/config ${HOME}/.ssh/
cp -vr ../dotfiles/.config/picom/picom.conf ${HOME}/.config/picom/
cp -vr ../dotfiles/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml ${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml/
cp -vr ../s/* ${HOME}/s/

# update xfce settings
killall xfconfd
/usr/lib/xfce4/xfconf/xfconfd &
xfsettingsd --replace &
