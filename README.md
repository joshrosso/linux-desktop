# linux-desktop

This repository contains [joshrosso](https://twitter.com/joshrosso)'s
configuration for his daily driver. The contents of this repository are executed
after the OS is installed.

For details on how I install my OSs, see
[arch-install-guide](https://github.com/octetz/arch-windows-encrypted-uefi-install).

## Commands

To update this repo's contents run:

```
make update
```

Window manager compilation/install:

```
sudo make install-wm
```

Terminal manager compilation/install:

```
sudo make install-term
```

Arch package install:

```
sudo make install-packages
```

AUR package install:

```
make install-aur-packages
```
