	mkdir -p \
	../dotfiles \
	../dotfiles/.ssh \
	../dotfiles/.config/nvim \
	../dotfiles/.config/picom \
	../scripts \
	../scripts/usr/local/bin \
  ../dotfiles/.config/xfce4/xfconf/xfce-perchannel-xml

	cp -frv \
	${HOME}/.bash_aliases \
	${HOME}/.bash_profile \
	${HOME}/.bashrc \
	${HOME}/.gitconfig \
	${HOME}/.tmux.conf \
	${HOME}/.Xresources \
	${HOME}/.xinitrc \
	${HOME}/.Xresources \
	${HOME}/.xbindkeysrc \
	../dotfiles/

	cp -rv ${HOME}/.ssh/config ../dotfiles/.ssh/
	cp -rv ${HOME}/.config/picom/picom.conf ../dotfiles/.config/picom/
	cp -rv /usr/local/bin/bye ../scripts/usr/local/bin/
	cp -rv /usr/local/bin/importc ../scripts/usr/local/bin/
	cp -rv ${HOME}/.config/nvim/init.vim ../dotfiles/.config/nvim/
	cp -rv ${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml ../dotfiles/.config/xfce4/xfconf/xfce-perchannel-xml/
