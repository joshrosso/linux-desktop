# linux-desktop

This repository contains [joshrosso](https://twitter.com/joshrosso)'s
configuration for his daily driver.

## Commands

To update this repo's contents run:

```
make update
```

Arch package install:

```
sudo make install-packages
```

AUR package install:

```
make install-aur-packages
```

To configure the machine:

```
make configure && sudo make configure-sudo
```

Window manager compilation/install:

```
sudo make install-wm
```

Terminal manager compilation/install:

```
sudo make install-term
```

### Runtime details

This section contains notes about ensuring specific applications run well.

## Zoom

### Black screen during screen sharing

When sharing screens against an X window system, a compositor is required or
else your screen will go black while sharing.

zoom support page:
https://support.zoom.us/hc/en-us/articles/202082128-Black-Screen-During-Screen-Sharing 

While zoom recommends xcompmgr, picom (previously compton) is a more modern
solution. ref: https://www.reddit.com/r/linuxquestions/comments/89ibgy/compton_vs_xcompmgr
