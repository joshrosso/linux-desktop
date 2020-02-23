	mkdir -p \
	../dotfiles \
	../dotfiles/.ssh \
	../dotfiles/.config/nvim \
	../dotfiles/.config/picom \
	../scripts \
	../scripts/usr/local/bin 

	cp -fr \
	${HOME}/.bash_aliases \
	${HOME}/.bash_profile \
	${HOME}/.bashrc \
	${HOME}/.gitconfig \
	${HOME}/.tmux.conf \
	${HOME}/.xinitrc \
	${HOME}/.Xresources \
	../dotfiles/

	cp -r ${HOME}/.ssh/config ../dotfiles/.ssh/
	cp -r ${HOME}/.config/picom/picom.conf ../dotfiles/.config/picom/
	cp -r /usr/local/bin/bye ../scripts/usr/local/bin/
	cp -r /usr/local/bin/importc ../scripts/usr/local/bin/
	cp -r ${HOME}/.config/nvim/init.vim ../dotfiles/.config/nvim/
