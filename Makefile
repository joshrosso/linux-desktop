update: 
	cd pkg && ./update-config.sh

configure:
	cd pkg && sudo ./configure-system.sh && ./configure-user.sh

install-packages:
	cd pkg && sudo ./install-official-packages.sh && ./install-aur-packages.sh

install-wm:
	cd dwm && $(MAKE) install

install-term:
	# clean is important to ensure ~/.terminfo
	# is updated on system
	cd st && $(MAKE) clean install
