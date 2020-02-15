update: 

	mkdir -p \
	dotfiles \
	dotfiles/.ssh \
	dotfiles/.config/nvim \
	scripts \
	scripts/usr/local/bin 

	cp -fr \
	${HOME}/.bash_aliases \
	${HOME}/.bash_profile \
	${HOME}/.bashrc \
	${HOME}/.gitconfig \
	${HOME}/.tmux.conf \
	${HOME}/.xinitrc \
	${HOME}/.Xresources \
	./dotfiles 

	cp -r ${HOME}/.ssh/config dotfiles/.ssh/
	cp -r /usr/local/bin/bye scripts/usr/local/bin/
	cp -r /usr/local/bin/importc scripts/usr/local/bin/
	cp -r ${HOME}/.config/nvim/init.vim dotfiles/.config/nvim/

configure:
	mkdir -p \
	  ${HOME}/.ssh \
	  ${HOME}/.config/nvim

	cp -fr \
		dotfiles/.bash_aliases \
		dotfiles/.bash_profile \
		dotfiles/.bashrc \
		dotfiles/.gitconfig \
		dotfiles/.tmux.conf \
		dotfiles/.xinitrc \
		dotfiles/.Xresources \
	  ${HOME}/

	cp -r dotfiles/.ssh/config ${HOME}/.ssh/
	cp -r dotfiles/.config/nvim/init.vim ${HOME}/.config/nvim/
	cp -r scripts/usr/local/bin/bye /usr/local/bin/

configure-sudo:
	cp -r scripts/usr/local/bin/bye /usr/local/bin/
	cp -r scripts/usr/local/bin/importc /usr/local/bin/


install-wm:
	cd dwm && $(MAKE) install

install-term:
	# clean is important to ensure ~/.terminfo
	# is updated on system
	cd st && $(MAKE) clean install

install-packages:
	./pacman.sh

install-aur-packages:
	./aur.sh
